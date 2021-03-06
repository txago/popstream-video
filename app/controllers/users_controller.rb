class UsersController < ApplicationController
  before_action :set_user, only: [:follow, :unfollow, :show]

  def index
    @users = User.where.not(id: current_user.id)
  end

  #follow criadas contagem
  def show
    @user = User.find(params[:id])
    redirect_to perfil_path if current_user == @user
  end

  def follow
    if current_user.follow(@user.id)
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js { render action: :follow }
      end
    end
  end

  def unfollow
    if current_user.unfollow(@user.id)
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js { render action: :follow }
      end
    end
  end

  def profile
    @user = current_user
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

end
