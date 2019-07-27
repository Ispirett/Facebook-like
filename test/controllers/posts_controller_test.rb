require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  def setup
   @posts = posts(:one)
   #post new_user_session_path(users(:I))
  end

  test 'Should redirect when not logged in' do
    assert_no_difference 'Post.count' do
      post posts_path, params: {post:{content: @posts.content}}
    end
    assert_redirected_to new_user_session_path
  end

  test 'should be success full once logged in' do

  end

end
