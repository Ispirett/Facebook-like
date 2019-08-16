require 'rails_helper'

RSpec.feature "Comments", type: :feature do
  let(:user) {create(:user)}
  let(:post) {build(:post)}
  let(:comment) {build(:comment)}

  context "with Post" do

    it 'should comment on posts' do
        sign_in user
        visit posts_path
        #create_post(post)

        fill_in 'post_content', with: post.content
        click_button 'submit'
        click_button 'comment-button'
        fill_in 'comment_body', with: comment.body
        click_button 'submit'
        click_button 'comment-button'
        expect(page).to have_content post.content
    end

  end
end
