require 'rails_helper'

RSpec.feature "Likes", type: :feature do
   let(:user) {create :user}
   let(:post) {build :post}

  describe 'Feature likes  ' do

     it "likes saved once logged in" do
       sign_in user
       visit posts_path

       fill_in 'post_content', with: post.content
       click_button 'commit'

       like_a_post

       expect(page).to have_content 'you just liked this post'
     end
   end
end
