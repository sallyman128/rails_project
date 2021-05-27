class PaintingsController < ApplicationController
  def index
    @paintings = Painting.all
  end

  def show
    @painting = Painting.find_by(id: params[:id])
  end
end