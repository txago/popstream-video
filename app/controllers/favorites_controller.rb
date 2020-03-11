class FavoritesController < ApplicationController

 def set_favorite_movie
  user = User.find(params[:user_id])
  movie = Movie.find(params[:movie_id])
  favorite_movie = FavoriteMovie.find_or_initialize_by(user: user, movie: movie)
  render json: {success: favorite_movie.save}.to_json
 end
end



