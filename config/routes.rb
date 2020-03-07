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
  get '/edit_directors', to: "directors#edit"
  get '/edit_genres', to: "genres#edit"
  get '/edit_movies', to: "movies#edit"
end
