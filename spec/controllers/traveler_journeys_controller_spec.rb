require 'rails_helper'

RSpec.describe Traveler::JourneysController, type: :controller do
  # describe 'GET index' do
  #   let!(:user) {create :user}
  #   let!(:journey) {create :journey, user_id: user.id}
  #   before(:each){
  #    sign_in(user)
  #   }
  #   it 'assigns @journeys' do 
  #    get :index
  #    expect(assigns(:journeys)).to eq([journey])
  #   end 
  # end 

  describe "Create Journey" do
    let(:user) { create :user } 
    let(:journey) {create :journey,user_id:user.id}
    before(:each){
      sign_in(user)
    }
    it 'should redirect to journeys' do
      post :create, params: {journey:{from:'ajdsj',to:'fasdj',departure:'Fri, 09 Dec 2022 02:08:49 -0500',rate:32,capacity:234}}
      expect(Journey.count).to eq(1)
      expect(response).to redirect_to(traveler_journeys_path)
      follow_redirect!
    end
  end 
end
