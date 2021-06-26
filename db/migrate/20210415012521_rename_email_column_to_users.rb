# frozen_string_literal: true

class RenameEmailColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :email, :line_id
  end
end
