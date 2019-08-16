require 'rails_helper'

RSpec.describe User, type: :model do

  let(:user) {build(:user)}
  let(:user2) {build(:user_two)}



  context "validations  "do
    it 'ensures email is present' do
      expect(user.valid?).to eq(true)
    end

    it 'ensures user doest save without password and email' do
      user.email = nil
      user.password = nil
      expect(user.valid?).to eq false
    end

  end

  context 'tests  user scopes' do
    before(:each) do
      user.save
      user2.save
      user2.friends << user
    end

    it 'user has no friends' do
       expect(user.friends.count).to eq(0)
    end

    it 'user has friends' do
      expect(user2.friends.count).to eq(1)
    end
  end


end
