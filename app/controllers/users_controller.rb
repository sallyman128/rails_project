class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
  
  def show
    @user = User.find_by(id: params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to paintings_path
    else
      render "new"
    end
  end

  def destroy
    user = User.find_by(id: params[:id])
    if user && user == User.find_by(id: session[:user_id])
      user.galleries.destroy
      user.destroy
      session.destroy
    end
    redirect_to root_path
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password)
    end

end