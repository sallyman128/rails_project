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
    @gallery = Gallery.find_by(id: params[:id])
    if @gallery.update(gallery_params)
      redirect_to gallery_path(@gallery)
    else
      render 'edit'
    end
  end
  
  def destroy
    gallery = Gallery.find_by(id: params[:id])
    gallery.destroy
    redirect_to galleries_path
  end

  private
    def gallery_params
      params.require(:gallery).permit(:user_id, :name, painting_ids:[])
    end
  
end