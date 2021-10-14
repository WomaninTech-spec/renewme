class CreateRecommandations < ActiveRecord::Migration[6.0]
  def change
    create_table :recommandations do |t|
      t.references :users_skill, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :level
      t.text :content

      t.timestamps
    end
  end
end
