Rails.application.routes.draw do
  root 'dashboard#index'

   devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

   namespace :traveler do
    resources :dashboards, only: [:index]
   end

   namespace :traveler do 
    resources :journeys
   end
   resources :orders do
    member do
      get :update_status
    end
   end
   get 'journey_list',to: 'traveler/journeys#journey_list'
   get 'received_orders',to: 'orders#received_orders'
   namespace :sender do
    resources :dashboards
   end 
end