class Experience < ApplicationRecord
  belongs_to :user
  validates :content, presence: true, length: { minimum: 10 }
  validates :start_date, presence: true
end
