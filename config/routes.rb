Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  root 'home#index'
  resources :believers
  resources :prays do
    resources :pray_requests, only: %i[index create new]
    member do
      get :donations
    end
  end

  resources :pray_requests, except: %i[index create new]

end
