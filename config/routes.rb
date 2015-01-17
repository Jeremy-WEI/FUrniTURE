Rails.application.routes.draw do
  root 'application#welcome'
  devise_for :users
  resources :furnitures
  # get '/welcome', to: 'application#welcome'
end
