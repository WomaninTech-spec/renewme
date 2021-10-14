class AddIndexToFollowingsUsers < ActiveRecord::Migration[6.0]
  add_foreign_key :followings_users, :users, column: :followee_id, primary_key: :id
  add_foreign_key :followings_users, :users, column: :follower_id, primary_key: :id
end
