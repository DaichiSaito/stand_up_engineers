# frozen_string_literal: true

class User < ApplicationRecord
  has_one :clock, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :line_id, presence: true, uniqueness: true
end
