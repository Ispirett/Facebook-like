require 'rails_helper'

RSpec.feature "Likes", type: :feature do
   let(:user) {create :user}
   let(:post) {build :post}

  describe 'Validates likes ' do
  #    # before do
  #    #   post.user_id = user.id
  #    #   post.save
  #    # end
  #
  #    it "likes saved once logged in" do
  #      sign_in user
  #      visit posts_path
  #
  #      fill_in 'post_content', with: post.content
  #      click_button 'commit'
  #
  #      # fill_in 'like[post_id]', with: post.id
  #       h = find :xpath, "//input[@id='like_post_id']"
  #       h.set 1
  #       click_button 'submit'
  #
  #      expect(page).to have_text 'you just liked this post'
  #    end
   end
end
