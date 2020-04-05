Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  namespace :admin do
    resources :shops
  end
  root to: 'bentos#index'
  resources :bentos
end
