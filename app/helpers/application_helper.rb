module ApplicationHelper
  def find_user(user_id)

    User.find(user_id)
  end

  def user_gravatar(user, img_class= '')
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravitar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravitar_url, alt: user.username, class: img_class)
  end

end
