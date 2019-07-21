class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  # TODO for users and friends. Current user must check if there id is in the friend column of the friendships table
  # TODO and if the status is pending.
  # TODO if so the user should see "accept friend request from username"
  # TODO the user that sent the friend request should see "friend request sent"
  def index
  @posts = Post.user_and_friends(current_user)
  @comment = Comment.new
  #@post = Post.find(2)
  @post_create = Post.new
  @like = Like.new
  end





  def create
    @post_create = Post.new(post_params)
    @post_create.user_id = current_user.id
    if @post_create.save
      flash[:success] = 'You post what successfully submmited'
      redirect_to root_path
    else
      flash[:danger] = "There was an error/errors #{@post_create.errors.full_messages}"
      redirect_to root_path
    end
  end


  private
  def post_params
    params.require(:post).permit(:content)
  end
end
