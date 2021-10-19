class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  include PgSearch::Model

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable
  enum role: [:candidate, :recruiter]

  attr_writer :login

  # see if can remove user_
  has_many :followees, class_name: 'FollowingsUser', foreign_key: :followee_id
  has_many :followers, class_name: 'FollowingsUser', foreign_key: :follower_id
  has_many :messages
  has_many :chatrooms, -> { distinct }, through: :messages
  has_many :users_skills
  has_many :skills, through: :users_skills
  has_many :experiences
  has_one_attached :profile_picture

  validates :first_name, :last_name, :username, :job_position, :about_me, presence: true
  validates :username, uniqueness: { case_sensitive: false }, length: { minimum: 3 }
  validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true

  pg_search_scope :global_search,
    against: [:username, :job_position, :role],
    associated_against: {
      skills: [:name],
      experiences: [:content]
    },
    using: {
      tsearch: { prefix: true }
    }

  def role=(value)
    value = value.to_i if value.is_a? String
    super(value)
  end

  def find_or_create_chatroom_with(other_user)
    chatroom = Chatroom.eager_load(:messages).where(
      messages: { user_id: self.id },
      messages: { user_id: other_user.id }
    ).first

    if chatroom.nil?
      chatroom = Chatroom.create(name: "#{self.username} - #{other_user.username}")
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
