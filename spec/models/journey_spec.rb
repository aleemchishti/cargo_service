require 'rails_helper'

RSpec.describe Traveler::JourneyController, type: :model do
  context 'when creating a Journey' do 
    let (:user) {create :user}
    let(:journey) {create:journey, user_id: user.id}
    it 'should be valid journey with all attributes' do
      expect(journey.valid?).to eq(true) 
    end 
  end 
end
