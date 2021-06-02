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

  private
  def comment_params
    params.require(:comment).permit(:user_id, :painting_id, :message)
  end
end