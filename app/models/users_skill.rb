class UsersSkill < ApplicationRecord
  belongs_to :user
  belongs_to :skill
  has_many :recommandations, dependent: :destroy
  enum level: [:junior, :intermediate, :senior]
  validates :level, inclusion: { in: levels.keys }, presence: true
end
