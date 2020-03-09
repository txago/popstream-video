class GenresController < ApplicationController
  before_action :set_genre, only: [:show, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :edit, :new, :create, :show, :destroy]

  def index
    @genres = Genre.all
  end

  def edit
    @genres = Genre.all
  end

  def show
    @genre = Genre.find(params[:id])
  end

  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to edit_genres_path
    else
      render :new
    end
  end

  def destroy
    @genre.destroy
    redirect_to edit_genres_path
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end

  def set_genre
    @genre = Genre.find(params[:id])
  end
end
