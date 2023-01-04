Rails.application.routes.draw do
  resources :orders

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
       get 'journey_list',to: 'traveler/journeys#journey_list'
       namespace :sender do
              resources :dashboards
       end 
end