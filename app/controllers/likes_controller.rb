class LikesController < ApplicationController
  before_action :authenticate_user!, only: :create


  def create
    @like = Like.new(like_params)
    @like.user_id = current_user.id
    if already_liked?
      destroy
    else
      if @like.save
        flash[:success] = 'you just liked this post'
        redirect_to request.referrer
      else
        flash[:danger] = "something went wrong"
        redirect_to :back
      end
    end

  end

  def destroy
    like = Like.where(user_id:current_user.id, post_id: params[:like][:post_id]).select(:id).first
    if Like.find(like.id).destroy
      flash[:success] = 'you have unlike this post'
      redirect_to root_path
    else
      flash[:success] = 'failed to unlike this post'
    end
  end


private

  def already_liked?
    Like.where(user_id:current_user.id, post_id: params[:like][:post_id]).exists?
  end



  def like_params
    params.require(:like).permit(:post_id)
  end
end
