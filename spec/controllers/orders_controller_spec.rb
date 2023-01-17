require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
  describe "Create Order" do
    before(:each) do 
     sign_in(sender)
    end 

    let(:sender) { create :user, role: User.roles[:sender], email:'some@email.com' }
    let(:traveler) {create :user, role: User.roles[:traveler]}
    
    it 'should render new and create order' do
      get :new
      expect(response).to render_template('orders/new')
      post :create, params: {order: {sender_name: 'ahdsf',receiver_name: 'asdf', from: 'Lahore', to: 'Islamabad', departure: '2023-01-15 00:00:00 UTC', contact: 213234, weight: 234, status:'pending',traveler_id: traveler.id}}
      expect(Order.count).to eq(1)
      expect(response).to redirect_to(orders_path) 
    end
  end

  describe '#update' do 
    let(:sender) {create :user, role: User.roles[:sender], email:'random@email.com'}
    let(:traveler) {create :user, role: User.roles[:traveler]}
    before(:each) do
      sign_in(sender)
    end 
    let(:order) {create :order, traveler_id: traveler.id, sender_id: sender.id}

    it 'should render edit and update order' do
      expect(get: "/orders/1/edit").to route_to(controller: "orders", action: "edit", id: "#{order.id}")
    
      patch :update, { params: { id: order.id, order: { sender_name:'updated' } } }
      expect(assigns[:order].sender_name).to eq('updated')
    end  
  end 

  describe "#destroy" do
    let(:sender) {create :user, role: User.roles[:sender], email:'destroy@email.com'}
    let(:traveler) {create :user, role: User.roles[:traveler]}
    before(:each) do 
     sign_in(sender)
    end 
    let(:order) {create :order, traveler_id: traveler.id, sender_id: sender.id}

    it "deletes the order" do
      expect { delete :destroy, params: { id: order.id } }.to change(Order, :count).by(-1)
    end

    it "redirects to the orders index" do
      debugger
      delete :destroy, params: { id: order.id }
      expect(response).to redirect_to orders_path
    end
  end
end