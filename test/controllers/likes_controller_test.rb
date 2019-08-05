require 'test_helper'

class LikesControllerTest < ActionDispatch::IntegrationTest
  

  def setup()
  end

  test "should get index" do
    sign_in users(:michael)
    get root_path
    assert_response :success
  end

  test "should sign_in" do
    post user_session_path, params: { session: { email: "i@gmail.com" , password: '12345678', remember_me:false} }
    assert_response :success
  end


end
