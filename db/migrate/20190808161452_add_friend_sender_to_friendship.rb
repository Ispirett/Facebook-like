class AddFriendSenderToFriendship < ActiveRecord::Migration[6.0]
  def change
    add_column :friendships, :friend_sender_id, :integer
  end
end
