Rails.application.routes.draw do
  resources :watchlists

  root 'application#welcome'
  devise_for :users
  resources :furnitures
  get '/search', to: 'furnitures#search'
  resources :users
  # get '/welcome', to: 'application#welcome'
end
