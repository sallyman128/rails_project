class SessionsController < ApplicationController
  def signin #get
  end

  def login #post
    raise
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to paintings_path
    else
      redirect_to signin_path
    end
  end

  def logout
    session.destroy
    redirect_to root_path
  end

  private
  
    def auth
      request.env['omniauth.auth']
    end

end