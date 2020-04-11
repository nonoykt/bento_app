Rails.application.routes.draw do
  post '/signup', to: 'users#create'
  resources :users


  get '/login', to: 'sessions#new'
  match '/login', to: 'sessions#create', via: [:post, :patch, :put]
  delete '/logout', to: 'sessions#destroy'
  namespace :admin do
    resources :shops
  end

  root to: 'bentos#index'
  resources :bentos do
    post :confirm, action: :confirm_new, on: :new
    post :import, on: :collection
  end
end
