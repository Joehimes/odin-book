class User < ApplicationRecord
  has_many :friend_requests, dependent: :destroy
  has_many :pending_friends, through: :friend_requests, source: :friend
  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships
  has_many :posts
  has_one :profile
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def remove_friend(friend)
    current_user.friends.destroy(friend)
  end

  def feed
    Post.where("user_id IN (?) OR user_id = ?", friend_ids, id)
  end

  
end
