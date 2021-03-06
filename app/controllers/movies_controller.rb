class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show, :new, :create, :edit, :update, :destroy]

  def index
    @movies = Movie.all
  end

  def show
    @user = current_user
    @movie = Movie.find(params[:id])
    @genre = Movie.where('genre_id = ?', @movie.genre_id).where.not(id: @movie.id)
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to movies_path
    else
      render :new
    end
  end

  def edit; end

  def update
    @movie.update(movie_params)
    redirect_to movies_path
  end

  def destroy
    @movie.destroy
    redirect_to movies_path
  end

  private

  def movie_params
    params.require(:movie).permit(:name, :description, :year, :country, :platform, :link, :imdb_score, :duration, :director_id, :genre_id, :trailer_url, :image)
  end

  def set_movie
    @movie = Movie.find(params[:id])
  end
end
