class Order < ApplicationRecord
	belongs_to :traveler, foreign_key: 'traveler_id',class_name: 'User'
	belongs_to :sender, foreign_key: 'sender_id',class_name: 'User'
	has_many :line_items
end
