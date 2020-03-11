Rails.application.routes.draw do
  devise_for :users
  get '/my_profile', to: "users#my_profile"
  root to: 'pages#home'
  resources :directors do
    resources :movies
  end
  resources :genres do
    resources :movies
  end
  resources :movies
end
