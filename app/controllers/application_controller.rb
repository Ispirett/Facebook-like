class ApplicationController < ActionController::Base
  include ApplicationHelper
  def users
    user_friends = Friendship.confirmed_friends(current_user.id).distinct.pluck(:friend_id)
    friend_users = Friendship.confirmed_friends(current_user.id).distinct.pluck(:user_id)
    @users = User.where.not(id:user_friends + friend_users)

  end

  def friend_status(user)
    @friend_requests_sent = current_user.friendships.friend_requests_sent
    @confirmed = Friendship.confirmed_friends(current_user.id)
    @awaiting_confirmation = Friendship.awaiting_response(user)

  end
end
