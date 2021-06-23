class RemoveUserColumn < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :start_time, :datetime
    remove_column :users, :set_time, :integer
    remove_column :users, :break_time, :integer
    remove_column :users, :category, :string
  end
end
