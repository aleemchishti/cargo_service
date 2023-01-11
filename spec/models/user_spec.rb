require 'rails_helper'

RSpec.describe User, type: :model do
  context 'when creating an User' do 
    let (:sender) {create :user}
    let (:traveler) {create :user,email:'travelerr@testt.com',role:'traveler'}
    it 'should be valid order with all attributes' do
      expect(sender.valid?).to eq(true) 
      expect(traveler.valid?).to eq(true) 
    end 
  end 
end
