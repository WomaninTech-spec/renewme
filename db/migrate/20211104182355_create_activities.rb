class CreateActivities < ActiveRecord::Migration[6.0]
  def change
    create_table :activities do |t|
      t.string :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
