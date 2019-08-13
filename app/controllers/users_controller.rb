class UsersController < ApplicationController
  def show
    @friend = User.find(params[:id])
    @friend_count = Friendship.confirmed_friends(params[:id])
    @posts = @friend.posts
    @comment = Comment.new
    @post_create = Post.new
    @like = Like.new
    friend_status(current_user.id)
    users
  end
end
