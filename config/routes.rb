Rails.application.routes.draw do
  # resources :watchlists

  root 'application#welcome'
  devise_for :users, :controllers => {:registrations => "users/registrations"}
  # devise_for :users
  resources :furnitures
<<<<<<< HEAD
  # resources :users
=======
  resources :watchlists do
    resources :furnitures
  end

>>>>>>> 1c0315615057eccb1df79ceb2334e5e4eb093628
  # get '/welcome', to: 'application#welcome'
end
