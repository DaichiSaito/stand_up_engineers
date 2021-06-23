# frozen_string_literal: true

class Clock < ApplicationRecord
  belongs_to :user
  validates :set_time, presence: true, inclusion: { in: [25, 45, 50, 60] }
  validates :break_time, presence: true, inclusion: { in: [5, 10, 15, 30] }
  validates :category, presence: true, inclusion: { in: ["筋トレ","ストレッチ", "ヨガ", "ザ・きんにくTV"] }

    def self.create_clock(clock_params)
      clock = Clock.new(clock_params)
      clock.start_time = Time.now
      clock.save!
    end
 end
