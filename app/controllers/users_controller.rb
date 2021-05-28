class UsersController < ApplicationController
  
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
    user.destroy
    session.destroy
    redirect_to root_path
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password)
    end

end