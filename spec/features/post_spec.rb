require 'rails_helper'

RSpec.feature "Posts", type: :feature do
  let(:user) {create :user }
  let(:post) {build :post}
  context 'Authentication' do

    it 'should login to homepage posts' do
      sign_in user
      visit posts_path
      expect(page).to have_content user.username
    end

    it 'should not access homepage posts if user not logged in' do
      visit posts_path
      expect(page).to have_content 'You need to sign in or sign up before continuing'
    end
  end

  context 'Creating posts' do

   it 'should create a posts ' do
     sign_in user

     visit posts_path
     fill_in 'post_content', with: post.content
     click_button 'commit'
     expect(page).to have_text post.content

    end
  end



end
