class FavoriteMoviesController < ApplicationController
  def set_favorite_movie
    @movie = Movie.find(params[:movie_id])
    favorite_movie = current_user.favorite_movies.find_by(movie: @movie)

    return favorite_movie.destroy if favorite_movie.present?

    current_user.favorite_movies.create(movie: @movie)
  end
end
