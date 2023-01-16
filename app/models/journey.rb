class Journey < ApplicationRecord
	validates :from, :to, :departure, :rate, :capacity, presence: true
	belongs_to :user
end
