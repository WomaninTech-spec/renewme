class CreateJobs < ActiveRecord::Migration[6.0]
  def change
    create_table :jobs do |t|
      t.string :title
      t.text :description
      t.boolean :visible, default: false

      t.timestamps
    end
  end
end
