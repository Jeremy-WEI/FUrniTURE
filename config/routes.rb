Rails.application.routes.draw do
  # resources :watchlists

  root 'application#welcome'
  devise_for :users, :controllers => {:registrations => "users/registrations"}
  # devise_for :users
  resources :furnitures

  get 'watchlists/my_watch_list', to: 'watchlists#show'
  get 'watchlists/my_watch_list/edit', to: 'watchlists#edit'
  # get '/welcome', to: 'application#welcome'
end
