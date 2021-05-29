class PaintingsController < ApplicationController
  def index
    if params[:user_id]
      @user = User.find_by(id: params[:user_id])
      @paintings = @user.paintings
    else
      @paintings = Painting.all
    end
  end

  def show
    @painting = Painting.find_by(id: params[:id])
  end

  def new
    if params[:gallery_id]
      @painting = Painting.new()
      @painting.gallery_ids = [params[:gallery_id]]
    else
      @painting = Painting.new
    end
  end

  def create
    @painting = Painting.new(painting_params)
    if @painting.save
      redirect_to paintings_path
    else
      render "new"
    end
  end

  def search
    if params[:query]
      @paintings = Painting.search(params[:query])
    else
      @paintings = Painting.all
    end
  end

  private
  def painting_params
    params.require(:painting).permit(:title, :artist_name, :country, gallery_ids:[])
  end

end