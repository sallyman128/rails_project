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
    gallery_paintings_params[:paintings][1..].each { |id| @gallery.paintings << Painting.find_by(id: id) }
    if @gallery.save
      redirect_to galleries_path
    else
      render 'new'
    end
  end
  
  def edit
    @gallery = Gallery.find_by(id: params[:id])
  end

  def update

  end
  
  def destroy

  end

  private
    def gallery_params
      params.require(:gallery).permit(:user_id, :name)
    end

    def gallery_paintings_params
      params.require(:gallery).permit(paintings:[])
    end
end