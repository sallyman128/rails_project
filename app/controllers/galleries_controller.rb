class GalleriesController < ApplicationController
  def index
    if params[:user_id]
      @user = User.find_by(id: params[:user_id])
      @galleries = @user.galleries
    else
      @galleries = Gallery.all
    end
  end

  def show
    @gallery = Gallery.find_by(id: params[:id])
  end
end