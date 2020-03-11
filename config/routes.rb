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
  get "set-favorite-movie", to: "favorite_movies#set_favorite_movie"
  get "remove-favorite-movie", to: "favorite_movies#remove_favorite_movie"
end

