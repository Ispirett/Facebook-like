class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User'

  scope :friend_requests_sent, -> (user) {where("user_id = ? AND status = ? ",user, 'pending')}
  scope :confirmed_friends, -> (user) {where("user_id = ? AND status = ? ",user, 'confirmed')}
  scope :awaiting_response, -> (user) {where(friend_id: user)}


end
