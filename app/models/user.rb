class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  enum role: [:sender, :traveler]
  
  has_many :journeys

  has_many :s_orders, foreign_key: :sender_id, class_name: 'Order'
  has_many :t_orders, foreign_key: :traveler_id, class_name: 'Order'
end
