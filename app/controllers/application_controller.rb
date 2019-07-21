class ApplicationController < ActionController::Base

  def users
    @users = User.all
  end

  def friend_status(user)
    @friend_requests_sent = Friendship.friend_requests_sent(user)
    @confirmed = Friendship.confirmed_friends(user)
    @awaiting_confirmation = Friendship.awaiting_response(user)

  end
end
