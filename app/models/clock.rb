# frozen_string_literal: true

class Clock < ApplicationRecord
  belongs_to :user
  validates :set_time, presence: true, inclusion: { in: [1,25, 45, 50, 60] }
  validates :break_time, presence: true, inclusion: { in: [1,5, 10, 15, 30] }
  validates :category, presence: true, inclusion: { in: ["筋トレ","ストレッチ", "ヨガ", "ザ・きんにくTV"] }


  class << Clock
    def  create_clock(user_id, clock_params)
      user =  User.find(user_id)
      clock = Clock.new(clock_params)
      clock.user_id = user.id
      clock.start_time = Time.now
      clock.save!
    end
  end
end
