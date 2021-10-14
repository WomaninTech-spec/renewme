class CreateJobsApplications < ActiveRecord::Migration[6.0]
  def change
    create_table :jobs_applications do |t|
      t.references :user, null: false, foreign_key: true
      t.references :job, null: false, foreign_key: true

      t.timestamps
    end
  end
end
