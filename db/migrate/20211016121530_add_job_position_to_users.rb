class AddJobPositionToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :job_position, :string
  end
end
