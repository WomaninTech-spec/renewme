class CreateFollowingsUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :followings_users do |t|
      t.references :followee
      t.references :follower

      t.timestamps
    end
  end
end
