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
      post.likes << like
      post.save
      post2.save
      
    end

    it 'should increment like' do
      expect(post.likes.length).to eq(1)
    end

    it 'should decrement like' do
      post.likes = []
      expect(post.likes.length).to eq(0)
    end
  end

end
