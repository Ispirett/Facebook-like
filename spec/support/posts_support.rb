
module PostSupport
def create_post(post)
  fill_in 'post_content', with: post.content
  click_button 'commit'
end
end