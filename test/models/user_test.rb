require 'test_helper'

class UserTest < ActiveSupport::TestCase



  test "should not save empty user" do
    article = User.new
    assert_not article.save, "Saved an empty user"
  end


  
end
