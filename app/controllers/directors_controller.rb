class DirectorsController < ApplicationController
  before_action :set_director, only: [:show, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :edit, :show, :new, :create, :destroy]

  def index
    @directors = Director.all
  end

  def edit
    @directors = Director.all
  end

  def show
    @director = Director.find(params[:id])
  end

  def new
    @director = Director.new
  end

  def create
    @director = Director.new(director_params)
    if @director.save
      redirect_to directors_path
    else
      render :new
    end
  end

  def destroy
    @director.destroy
    redirect_to directors_path
  end

  private

  def director_params
    params.require(:director).permit(:name, :photo)
  end

  def set_director
    @director = Director.find(params[:id])
  end
end
