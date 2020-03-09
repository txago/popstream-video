class DirectorsController < ApplicationController
  before_action :set_director, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show, :new, :create, :edit, :update, :destroy]

  def index
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

  def edit; end

  def update
    @director.update(director_params)
    redirect_to directors_path
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
