class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :edit, :new, :create, :show, :destroy]

  def index
    @movies = Movie.all
  end

  def edit
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
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

  def destroy
    @movie.destroy
    redirect_to movies_path
  end

  private

  def movie_params
    params.require(:movie).permit(:name, :description, :year, :country, :platform, :link, :imdb_score, :duration, :director_id, :genre_id, :trailer_url, :photo)
  end

  def set_movie
    @movie = Movie.find(params[:id])
  end
end
