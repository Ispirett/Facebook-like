require 'rails_helper'

RSpec.describe User, type: :model do
  let(:params) {{email: 'p@gmail.com',password: 'jdsidsdaifds' }}
  let(:user) {User.new(params)}
  let(:user2) {User.new(email: 'g@gmail.com',password: 'jdsidsdaifds' )}



  context "validdations  "do
    it 'ensures email is present' do
      user = User.new(params).valid?
      expect(user).to eq(true)
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
