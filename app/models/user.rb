class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # require  "omniauth-facebook"
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[facebook]

  has_many :friendships, foreign_key: :user_id, class_name: 'Friendship'
  has_many :friends, through: :friendships
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, as: :commentable

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      #user.name = auth.info.name
      #user.avatar = auth.info.avatar
    end
  end

  def username
    self.email.split('@')[0]
  end
  
end
