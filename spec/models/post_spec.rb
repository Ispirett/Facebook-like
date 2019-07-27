require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) {User.new(email: 'g@gmail.com',password: 'jdsidsdaifds' )}
  let(:first_post){Post.new(content: 'content')}
  let(:second_post){Post.new(user_id:user.id)}
  let(:third){ Post.new(content: 'hellodfdfd', user_id: user.id )}

  context 'validations' do

    it 'user_id should exist' do
        expect(first_post.valid?).to eq(false)
    end

    it 'should be a valid post' do
      expect(third.save).to eq(true)
    end




    it 'content should not be blank' do
      expect(second_post.valid?).to eq false
    end
    before(:each) do
      second_post.content = 'a' #* 2000
    end
    it "post length  should not be longer than 1500 " do
        expect(second_post.valid?).to eq false
    end


  end
end
