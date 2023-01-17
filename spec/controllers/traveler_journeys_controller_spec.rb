require 'rails_helper'

RSpec.describe Traveler::JourneysController, type: :controller do
  describe "Create Journey" do
    before(:each) do 
     sign_in(user)
    end 

    let(:user) { create :user, role: User.roles[:traveler] }
    
    it 'should render new and create journey' do
      get :new
      expect(response).to render_template('traveler/journeys/new')
      post :create, params: {journey: {from:'Lahore', to: 'Islamabad', departure: '2023-01-15 00:00:00 UTC', rate: 234, capacity: 234}}
      expect(Journey.count).to eq(1)
      expect(response).to redirect_to(traveler_journeys_path) 
    end
  end

  describe "Update Journey" do
    let(:user) { create :user, role: User.roles[:traveler] }
    let(:journey) { create :journey, user_id:user.id }
    
    before(:each) do 
     sign_in(user)
    end 

    
    it 'should render edit and update journey' do
     get :edit  
     expect(response).to render_template("journey/edit")
     expect(response).to have_http_status(200)
     patch traveler_journey_url(journey), params: {journey: {from:'gsd', to: 'Islamabad', departure: '2023-01-15 00:00:00 UTC', rate: 234, capacity: 234}}
     expect(response).to redirect_to(traveler_journeys_path) 
     expect(assigns[:journey].from).to eq('gsd')
    end
  end
end