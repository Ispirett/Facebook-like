require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get root" do
    get static_pages_home_url
    assert_response :success
  end


end
