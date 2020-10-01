class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true
  validates :full_name, presence: true

  has_one_attached :photo
  has_one_attached :cover_image

  has_many :tweets, foreign_key: :Author_id

  has_many :active_relationships, class_name: 'Following',
                                  foreign_key: 'Follower_id',
                                  dependent: :destroy
  has_many :passive_relationships, class_name: 'Following',
                                   foreign_key: 'Followed_id',
                                   dependent: :destroy

  has_many :following, through: :active_relationships, source: :Followed
  has_many :followers, through: :passive_relationships, source: :Follower

  scope :order_by_most_recent, -> { order(created_at: :desc) }

  def not_following
    User.order_by_most_recent.reject { |user| following.include?(user) || user == self }
  end

  def feed
    Tweet.where(Author: (following + [self])).includes(:Author)
  end
end
