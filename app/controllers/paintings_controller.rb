class PaintingsController < ApplicationController
  def index
    @paintings = Painting.all
  end

  def show
    @painting = Painting.find_by(id: params[:id])
  end

  def new
    @painting = Painting.new
  end

  def create
    @painting = Painting.new(painting_params)
    if @painting.save
      redirect_to paintings_path
    else
      render "new"
    end
  end

  private
  def painting_params
    params.require(:painting).permit(:title, :artist_name, :country)
  end
end