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

  def new
    @gallery = Gallery.new
    @user = User.find_by(id: session[:user_id])
  end

  def create
    # @gallery = Gallery.new(gallery_params)
    # if @gallery 

    raise params.inspect
  end

  private
    def gallery_params
      params.require(:gallery).permit(:name, :painting_ids => [], :user_id)
    end
end