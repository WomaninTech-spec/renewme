class CreateUsersSkills < ActiveRecord::Migration[6.0]
  def change
    create_table :users_skills do |t|
      t.references :user, null: false, foreign_key: true
      t.references :skill, null: false, foreign_key: true
      t.integer :level
      t.boolean :previous_skills

      t.timestamps
    end
  end
end
