require 'rails_helper'

RSpec.describe Like, type: :model do

  let(:user) {build(:user)}
  let(:like) {build(:like)}
  let(:like2) {build(:like_two)}
  let(:post) {build(:post)}
  let(:post2) {build(:post_two)}

  context "validations"do
    it 'ensures like is not save without user' do
      like.user_id = nil
      expect(like.valid?).to eq(false)
    end
  end

  context 'tests likes scopes' do
    before(:each) do
      user.save
      like.save
      like2.save
      post.save
      post2.save
      
    end

    it 'like has respect post' do
       expect(like.post_id).not_to eq(nil)
    end

    it 'like has respect user' do
      expect(like.user_id).not_to eq(nil)
    end
  end

end
