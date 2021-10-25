class Skill < ApplicationRecord
  has_many :users_skills, dependent: :destroy
  has_many :users, through: :users_skills
  include PgSearch::Model
  pg_search_scope :global_search,
    against: [:name],
    using: {
      tsearch: { prefix: true }
    }
end
