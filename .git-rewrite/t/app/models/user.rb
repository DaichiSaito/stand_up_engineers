class User < ApplicationRecord
    has_one :clock, dependent: :destroy

    validates :name, presence: true
    validates :line_id, presence: true
end
