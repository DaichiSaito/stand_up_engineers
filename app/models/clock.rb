class Clock < ApplicationRecord
  belongs_to :user

  validates :start_time, presence: true
  validates :set_time, presence: true
  validates :break_time, presence: true
  
end
