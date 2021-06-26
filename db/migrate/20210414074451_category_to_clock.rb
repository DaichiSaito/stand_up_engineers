# frozen_string_literal: true

class CategoryToClock < ActiveRecord::Migration[5.2]
  def change
    add_column :clocks, :category, :string
  end
end
