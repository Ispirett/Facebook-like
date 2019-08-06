require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) {build(:user)}
  let(:first_post){build(:post)}
  let(:second_post){build(:post_two)}

  context 'validations' do

    it 'user_id should exist' do
        expect(first_post.valid?).to eq(false)
    end

    it 'should be a valid post' do
       second_post.user = user
      expect(second_post.valid?).to eq(true)
    end

    it 'content should not be blank' do
      second_post.content = ''
      expect(second_post.valid?).to eq false
    end

    it "post length  should not be longer than 1500 " do
        second_post.user  = user
        second_post.content = 'a' * 3000
        expect(second_post.valid?).to eq false
    end


  end
end
