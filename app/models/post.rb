class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :commentable
  has_many :likes
  validates :content, presence: true, length: {maximum: 1500}
  default_scope -> {order(created_at: :desc)}

  def self.user_and_friends(user)
    user_friends_posts = Post.joins('INNER JOIN friendships  ON posts.user_id = friendships.friend_id')
        .where('friendships.status = ? AND friendships.user_id = ?','Confirmed',user.id).
        order(created_at: :desc)
    friends_user_posts = Post.joins('INNER JOIN friendships  ON posts.user_id = friendships.user_id')
                             .where('friendships.status = ? AND friendships.friend_id = ?','Confirmed',user.id).
        order(created_at: :desc)
    user_posts = user.posts
    user_friends_posts + friends_user_posts  + user_posts
  end


end
