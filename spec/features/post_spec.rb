require 'rails_helper'

RSpec.feature "Posts", type: :feature do
  context 'Authentication' do
    let(:user) {create :user }
    it 'should login to homepage posts' do
      sign_in user
      visit posts_path
      expect(page).to have_content user.username
    end

    it 'should not access hompage posts if user not logged in' do
      visit posts_path
      expect(page).to have_content 'You need to sign in or sign up before continuing'
    end
  end

  context 'Creating posts' do

    it 'should create a posts ' do

    end

  end


end
