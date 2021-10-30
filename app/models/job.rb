class Job < ApplicationRecord
  belongs_to :user
  has_many :jobs_applications, dependent: :destroy

  include PgSearch::Model

  pg_search_scope :job_search,
    against: [:title, :description],
    associated_against: {
      user: [:username]
    },
    using: {
      tsearch: { prefix: true }
    }
end
