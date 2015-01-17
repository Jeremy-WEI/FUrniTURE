Rails.application.routes.draw do
  resources :profiles

  # resources :watchlists

  root 'application#welcome'
  devise_for :users, :controllers => {:registrations => "users/registrations"}
  # devise_for :users
  resources :furnitures


  get '/my_watch_list', to: 'watchlists#show'
  get '/my_watch_list/edit', to: 'watchlists#edit'
  post '/furnitures/:id', to: 'furnitures#add_to_watch_list'
  post '/my_watch_list/:furniture_id', to: 'watchlists#unwatch'

  get '/search', to: 'furnitures#search'
  resources :users



  # get '/welcome', to: 'application#welcome'
end
