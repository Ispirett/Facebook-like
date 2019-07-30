require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "should be valid" do
    user = users(:michael)
    assert user.valid?
  end
end
