class CreateFollowingsJobs < ActiveRecord::Migration[6.0]
  def change
    create_table :followings_jobs do |t|
      t.references :job, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
