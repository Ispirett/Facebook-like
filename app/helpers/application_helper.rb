module ApplicationHelper
  def find_user(user)
    User.find(user)
  end
end
