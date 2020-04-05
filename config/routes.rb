Rails.application.routes.draw do
  root to: 'bentos#index'
  resources :bentos
end
