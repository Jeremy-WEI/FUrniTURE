Rails.application.routes.draw do
  # resources :watchlists

  root 'application#welcome'
  devise_for :users, :controllers => {:registrations => "users/registrations"}
  # devise_for :users
  resources :furnitures

  post 'users/:id' => 'catalog#view'

  resources :watchlists do
    resources :furnitures
  end

  # get '/welcome', to: 'application#welcome'
end
