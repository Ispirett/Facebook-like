class FriendshipsController < ApplicationController

  def create
    friend_params = params[:friendship][:friend_id]

      @friendship = Friendship.new(friend_id: friend_params, friend_sender_id:  current_user.id)
    if @friendship.save
      flash[:success] = "friend request sent too #{find_user(@friendship.friend_id).username}"
      redirect_to root_path
    else
      flash[:danger] = "User could not be added #{@friendship.errors.full_messages}"
      redirect_to root_path
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
