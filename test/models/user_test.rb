require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "should be valid" do
    user = users(:michael)
    assert user.valid?
  end

  test "login with valid information" do
    get sign_in_users_path
    assert_template 'sessions/new'
    post sign_in_users_path, params: { session: { email: "i@gmail.com", password: "12345678" } }
    assert_template 'sessions/new'
    assert flash.empty?
    get root_path
    assert flash.empty?
  end
end
