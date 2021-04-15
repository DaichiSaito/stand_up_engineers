class User < ApplicationRecord
    has_one :clock, dependent: :destroy
    
    validates :name, presence: true
    validates :email, presence: true
end
