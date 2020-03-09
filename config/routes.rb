Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :directors do
    resources :movies
  end
  resources :genres do
    resources :movies
  end
  resources :movies
  get '/edit-directors', to: "directors#edit"
  get '/edit-genres', to: "genres#edit"
  get '/edit-movies', to: "movies#edit"
end
