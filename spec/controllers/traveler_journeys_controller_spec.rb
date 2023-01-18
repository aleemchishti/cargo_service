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

  describe "#update" do
    let(:user) { create :user, role: User.roles[:traveler] }

    before(:each) do 
     sign_in(user)
    end

    let(:journey) { create :journey, user_id:user.id }
       
    it 'should render edit and update journey' do
     expect(get: "traveler/journeys/1/edit").to route_to(controller: "traveler/journeys", action: "edit", id: "#{journey.id}")
     patch :update, { params: { id: journey.id, journey: { from:'updated' } } }
     expect(response).to redirect_to(traveler_journeys_path) 
     expect(assigns[:journey].from).to eq('updated')
    end
  end
  
  describe "#destroy" do
    let(:user) {create :user, role: User.roles[:traveler]}
    before(:each) do 
     sign_in(user)
    end 
    let(:journey) {create :journey, user_id: user.id}

    it "deletes the journey" do
      expect { delete :destroy, params: { id: journey.id } }.to change(Journey, :count).by(0)
    end

    it "redirects to the journeys index" do
      delete :destroy, params: { id: journey.id }
      expect(response).to redirect_to traveler_journeys_path
    end
  end
end