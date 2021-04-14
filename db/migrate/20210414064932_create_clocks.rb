class CreateClocks < ActiveRecord::Migration[5.2]
  def change
    create_table :clocks do |t|
      t.references :user, foreign_key: true
      t.datetime :start_time
      t.integer :set_time
      t.integer :break_time

      t.timestamps
    end
  end
end
