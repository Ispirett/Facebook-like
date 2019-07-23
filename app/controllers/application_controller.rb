class ApplicationController < ActionController::Base
  include ApplicationHelper
  def users
    user_friends = current_user.friendships.not_friends
    @users = User.where.not(id:user_friends)

  end

  def friend_status(user)
    @friend_requests_sent = current_user.friendships.friend_requests_sent
    @confirmed = Friendship.confirmed_friends(current_user.id)
    @awaiting_confirmation = Friendship.awaiting_response(user)

  end
end
