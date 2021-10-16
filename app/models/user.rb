class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  before_validation :change_role_value

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable
  enum role: [:candidate, :recruiter]

  attr_writer :login

  # see if can remove user_
  has_many :user_followees, class_name: 'FollowingsUser', foreign_key: :followee_id
  has_many :user_followers, class_name: 'FollowingsUser', foreign_key: :follower_id
  has_many :messages
  has_many :chatrooms, through: :messages
  has_one_attached :profile_picture

  validates :first_name, :last_name, :username, :job_position, presence: true

  def change_role_value
    self.role = role.to_i
  end

  def find_or_create_chatroom_with(other_user)
    chatroom = Chatroom.eager_load(:messages).where(
      messages: { user_id: self.id },
      messages: { user_id: other_user.id }
    ).first

    if chatroom.nil?
      chatroom = Chatroom.create(name: "#{self.nickname} - #{other_user.nickname}")
      Message.create(user: self, chatroom: chatroom, content: "subscription")
      Message.create(user: other_user, chatroom: chatroom, content: "subscription")
    end
    return chatroom
  end

  def login
    @login || self.username || self.email
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    elsif conditions.has_key?(:username) || conditions.has_key?(:email)
      where(conditions.to_h).first
    end
  end
end
