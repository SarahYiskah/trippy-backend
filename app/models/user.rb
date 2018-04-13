class User < ApplicationRecord
  has_secure_password

  validates_email_format_of :email, :message => 'is not looking good'
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
  validates :password, presence: true


  has_many :microposts, dependent: :destroy
  has_many :active_relationships,  class_name:  "Relationship",
                                   foreign_key: "follower_id",
                                   dependent:   :destroy
  has_many :passive_relationships, class_name:  "Relationship",
                                   foreign_key: "followed_id",
                                   dependent:   :destroy
  has_many :following, through: :active_relationships,  source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  has_many :user_itineraries
  has_many :itineraries, through: :user_itineraries
  has_many :user_activities
  has_many :activities, through: :user_activities
  has_many :reviews, through: :activities

  # Follows a user.
  def follow(other_user)
    following << other_user
  end

  # Unfollows a user.
  def unfollow(other_user)
    following.delete(other_user)
  end

  # Returns true if the current user is following the other user.
  def following?(other_user)
    following.include?(other_user)
  end

  private
end
