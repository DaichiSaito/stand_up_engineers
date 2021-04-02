class AddColumnTimes < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :start_time, :datetime
    add_column :users, :set_time, :integer
    add_column :users, :break_time, :integer
  end
end
