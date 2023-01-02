Rails.application.routes.draw do
  resources :orders

       root 'dashboard#index'
 
       devise_for :users, controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations'
      }

       namespace :traveler do 
              resources :dashboard, only: [:index]
       end

       namespace :traveler do 
              resources :journey
       end 
       namespace :sender do
              resources :dashboard
       end 
end