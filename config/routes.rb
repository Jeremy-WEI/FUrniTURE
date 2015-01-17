Rails.application.routes.draw do
  root 'application#welcome'
  devise_for :users
  resources :furnitures
  resources :users
  # get '/welcome', to: 'application#welcome'
end
