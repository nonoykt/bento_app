Rails.application.routes.draw do
  namespace :admin do
    resources :shops
  end
  root to: 'bentos#index'
  resources :bentos
end
