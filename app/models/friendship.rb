class Friendship < ApplicationRecord
  #belongs_to :user
  belongs_to :friend, class_name: 'User'
  belongs_to :friend_sender, class_name: 'User'
  before_create :set_status
  before_validation :already_friends?

  # query  to check if friend ship all ready exits
  scope :friend_requests_sent, -> (user) {where("friend_sender_id = ? AND status = ? ", user ,'Pending')}

  scope :confirmed_friends,
        -> (user) {where('friend_sender_id = ? AND status  IN (?) OR friend_id = ? AND status  IN (?) ' ,
                                          user,['Confirmed'],user, ['Confirmed'])}
  scope :awaiting_response, -> (user) {where("friend_id = ?  AND status = ?",user, 'Pending')}

  scope :friendship_exist?, -> (user,friend) {where('friend_sender_id = ? AND status  IN (?) OR friend_id = ? AND status  IN (?) ',
                                                    user,['Confirmed','Pending'],friend, ['Confirmed', 'Pending'])}
  scope :not_friends, ->{pluck(:friend_id)}




 private
  def set_status
    self.status = 'Pending'
  end

  def already_friends?
   if Friendship.where('friend_sender_id = ? AND status  IN (?) AND friend_id = ? AND status  IN (?) ',
               self.friend_sender_id,['Confirmed','Pending'],self.friend_id, ['Confirmed', 'Pending']).exists?
     errors.add(:already_friends, 'This person has already sent you a friend request')
   end
  end
end
