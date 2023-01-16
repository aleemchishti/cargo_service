require 'rails_helper'

RSpec.describe Order, type: :model do
  context 'when creating an order' do 
    let (:sender) {create :user}
    let (:traveler) {create :user,email:'traveler@testt.com',role:'traveler'}
    let(:order) {create:order, sender_id: sender.id, traveler_id: traveler.id}
    it 'should be valid order with all attributes' do
      # sender=User.create(first_name:'test', last_name:'user', email:'test@userrr.com', country:'Test', contact:123421, password:'12345678',role:'sender')
      # traveler=User.create(first_name:'traveler', last_name:'user', email:'test@user.com', country:'Test', contact:123421, password:'12345678',role:'traveler')
      # order=Order.create(sender_name:'somename',receiver_name:'somereceiver',weight:23,contact:2314543,from:'Lahore', to:'Karachi', traveler_id: traveler.id, sender_id: sender.id)
      expect(order.valid?).to eq(true) 
    end 
  end 
end
