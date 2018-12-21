class Address < ApplicationRecord
    has_many :user
    validates :street, :city, :state, :neighbourhood, :postal_code, presence: true
end
