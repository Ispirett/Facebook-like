class PostsController < ApplicationController
  # TODO for users and friends. Current user must check if there id is in the friend column of the friendships table
  # TODO and if the status is pending.
  # TODO if so the user should see "accept friend request from username"
  # TODO the user that sent the friend request should see "friend request sent"
  def index
    @posts = Post.user_and_friends(current_user)
  end

end
