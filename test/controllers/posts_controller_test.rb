require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test "should create post" do
 
    sign_in users(:michael)
    get root_path
    get posts_path
    post posts_path, params: { post: { content: "Thinking" } }
    get posts_path
    assert_response :success
  end
  test "should show post" do

    get root_path
    sign_in users(:michael)
    get posts_path
    assert_response :success
  end
end
