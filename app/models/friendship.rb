class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User'
  before_create :set_status
  # query  to check if friend ship all ready exits
  scope :friend_requests_sent, -> {where("status = ? ", 'Pending')}
  scope :confirmed_friends,
        -> (user) {where('user_id = ? AND status  IN (?) OR friend_id = ? AND status  IN (?) ' ,
                                          user,['Confirmed','Pending'],user, ['Confirmed', 'Pending'])}
  scope :awaiting_response, -> (user) {where("friend_id = ?  AND status = ?",user, 'Pending')}
  scope :friendship_exist?, -> (user,friend) {where('user_id = ? AND status = ? AND friend_id = ? AND status = ? ' ,
                                                                               user,'Pending',friend, 'Pending')}
  scope :not_friends, ->{pluck(:friend_id)}




  private
  def set_status
    self.status = 'Pending'
  end
end
