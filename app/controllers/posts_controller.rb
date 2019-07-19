class PostsController < ApplicationController
  def index

    @user = User.find(current_user.id).friendships.where(status: 'confirmed').select(:friend_id)
    @friends = @user.map { |user| User.find(user.friend_id)}
    @friends_post = @friends.map { |u| u.posts}
    @post = Post.where(user_id:current_user.id) + @friends_post

  end
end
