class UsersSkill < ApplicationRecord
  belongs_to :user
  belongs_to :skill
  enum level: [:junior, :intermediate, :senior]
  validates :level, inclusion: { in: levels.keys }, presence: true
end
