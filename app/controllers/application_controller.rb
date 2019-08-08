class ApplicationController < ActionController::Base
  include ApplicationHelper
  def users
    user_friends = Friendship.friendship_exist?(current_user.id, current_user.id).distinct.pluck(:friend_id)
    friend_users = Friendship.friendship_exist?(current_user.id, current_user.id).distinct.pluck(:friend_sender_id)
    users_exclude = user_friends + friend_users + [current_user.id]
    @users = User.where.not(id:users_exclude)

  end

  def friend_status(user)
    @friend_requests_sent = Friendship.friend_requests_sent(user)
    @confirmed = Friendship.confirmed_friends(current_user.id)
    @awaiting_confirmation = Friendship.awaiting_response(user)

  end

  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || root_path
  end
end
