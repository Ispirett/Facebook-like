class FriendshipsController < ApplicationController

  # Create new friend shuip
  # Add user_id and friend id
  # make user is not all so a friend of current user
  def create
    friend_params = params[:friendship][:friend_id]
    @friendship_exist = Friendship.friendship_exist?(current_user,friend_params)
    @friendship = Friendship.new(friendship_params)
    @friendship.user_id = current_user.id

    if @friendship_exist.exists?
      flash[:success] = "This person is already your friend"
    else
    if @friendship.save
      flash[:success] = "friend request sent too #{find_user(@friendship.friend_id).username}"
      redirect_to root_path
    else
      flash[:danger] = "User could not be added #{@friendship.errors.full_messages}"
      redirect_to root_path
    end

    end

  end
  def update
    flash[:success] = 'accept_friends work'
    redirect_to root_path
  end

  def accept_friend
    @friendship = Friendship.find(params[:id])
    @friendship.update_attribute(:status,'Confirmed')
    flash[:success] = "you now friends#{find_user(@friendship.friend_id)} "
    redirect_to root_path
  end

  def destroy
    @friendship_exist.destroy_all
  end

  private
  def friendship_params
    params.require(:friendship).permit(:friend_id)
  end
end
