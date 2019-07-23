class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User'
  before_create :set_status
  # query check to check ig friend ship all ready exits\
  scope :friend_requests_sent, -> {where("status = ? ", 'Pending')}
  scope :confirmed_friends, -> (user) {where('user_id = ? AND status = ? OR friend_id = ? AND status = ? ' ,user,'Confirmed',user, 'Confirmed')}
  scope :awaiting_response, -> (user) {where("friend_id = ?  AND status = ?",user, 'Pending')}
  scope :friendship_exist?, -> (user,friend) {where(user_id:user,friend_id:friend)}
  scope :not_friends, ->{pluck(:friend_id)}

  #scope :possible_friends, -> (user) {where.not(user_id:user, friend_id:user)}


  private
  def set_status
    self.status = 'Pending'
  end
end
