Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/perfil', to: "users#profile"
  # created to followers logic
  # alterado index para home
  # para teste pelo menos
  get 'users/:id', to: 'users#show'

  resources :users, only: [:index, :show] do
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

