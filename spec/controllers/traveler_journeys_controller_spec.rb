require 'rails_helper'

RSpec.describe Traveler::JourneysController, type: :controller do
  describe 'GET index' do
    let!(:user) {create :user}
    let!(:journey) {create :journey, user_id: user.id}
    before(:each){
     sign_in(user)
    }
    it 'assigns @journeys' do 
      get :index
      # debugger
      expect(assigns(:journeys)).to eq([journey])
    end 
  end 
end 