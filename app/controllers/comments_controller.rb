class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @painting = Painting.find_by(params[:painting_id])
  end

  def create
    comment = Comment.new(comment_params)
    if comment.save
      redirect_to painting_path(comment.painting)
    else
      render 'new'
    end
  end

  def show
    @comment = Comment.find_by(id: params[:id])
  end
  
  def edit
    @comment = Comment.find_by(id: params[:id])
    @painting = @comment.painting
  end

  def update
    @comment = Comment.find_by(id: params[:id])
    @painting = @comment.painting
    if @comment.update(comment_params)
      redirect_to comment_path(@comment)
    else
      render 'edit'
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:user_id, :painting_id, :message)
  end
end