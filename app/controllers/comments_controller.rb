class CommentsController < ApplicationController
before_action :authenticate_user!, only: :create

  def create
    @comment = Comment.new(comment_params)
    @comment.commentable_type = 'Post'
    @comment.user_id = current_user.id
    if @comment.save
      flash[:success] = 'comment created'
      redirect_to root_path
    else
      flash[:danger] = "You comment was not posted #{@comment.errors.full_messages}"
      redirect_to root_path
    end

  end

  private
  def comment_params
    params.require(:comment).permit(:body, :commentable_id)
  end
end
