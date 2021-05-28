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
  end

  def create
    @gallery = Gallery.new(gallery_params)
    binding.pry
    if @gallery.save
      redirect_to galleries_path
    else
      render 'new'
    end
  end

  private
    def gallery_params
      params.require(:gallery).permit(:user_id, :name, paintings:[], paintings_attributes:[:title, :artist_name, :country])
    end
end