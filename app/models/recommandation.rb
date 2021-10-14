class Recommandation < ApplicationRecord
  belongs_to :users_skill
  belongs_to :user
end
