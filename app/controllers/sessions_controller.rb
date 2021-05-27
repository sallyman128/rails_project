class SessionsController < ApplicationController
  def signin #get
    
  end

  def login #post

  end

  def logout
    session.delete[:user_id]
    redirect_to root_path
  end

end