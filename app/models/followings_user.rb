class FollowingsUser < ApplicationRecord
  belongs_to :followee
  belongs_to :follower
end
