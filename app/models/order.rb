class Order < ApplicationRecord
	validates :sender_name, :receiver_name, :weight, :contact, :from, :to, presence: true 
	
	belongs_to :traveler, foreign_key: 'traveler_id',class_name: 'User'
	belongs_to :sender, foreign_key: 'sender_id',class_name: 'User'
	
	has_many :line_items, dependent: :destroy 
	accepts_nested_attributes_for :line_items, reject_if: :all_blank, allow_destroy: true 
end
