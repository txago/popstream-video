Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # created to followers logic
  # alterado index para home
  # para teste pelo menos
  resources :users, only: [:index] do
    member do
      post :follow
      post :unfollow
    end
  end
  # fim da follow logic

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

