Rails.application.routes.draw do
  resources :watchlists

  root 'application#welcome'
  devise_for :users
  resources :furnitures
  # resources :users
  # get '/welcome', to: 'application#welcome'
end
