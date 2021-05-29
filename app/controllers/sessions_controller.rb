class SessionsController < ApplicationController
  skip_before_action :require_login

  def signin #get
  end

  def login #post
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to paintings_path
    else
      redirect_to signin_path
    end
  end

  def omniauth_login
    user = User.find_or_create_by(id: auth[:uid]) do |u|
      u.name = auth['info']['name']
      u.email = auth['info']['email']
      u.password = Passgen::generate(length: 30, symbols: true)
    end
    session[:user_id] = user.id
    redirect_to paintings_path
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