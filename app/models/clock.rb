class Clock < ApplicationRecord
  belongs_to :user
  
  validates :set_time, presence: true
  validates :category, presence: true
  
end
