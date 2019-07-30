require 'rails_helper'

RSpec.describe Friendship, type: :model do
  let(:user) {build(:user)}
  let(:user_two) {build(:user_two)}
  let(:friendship) {build(:friendship)}


context 'Validations' do

     it 'user_id and and friend_id should not be blank' do
       expect(friendship.valid?).to eq false
     end

     it 'if user_id and and friend_id exist should save' do
       friendship.user = user
       friendship.friend = user_two
       expect(friendship.valid?).to eq true
     end

     it 'New saved friendships should have set status to Pending' do
       friendship.user = user
       friendship.friend = user_two
       friendship.status = nil
       friendship.save
      expect(friendship.status).to eq 'Pending'
     end

   end
end
