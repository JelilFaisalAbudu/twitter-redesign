class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true
  validates :full_name, presence: true

  has_one_attached :photo
  has_one_attached :cover_image

  has_many :tweets, foreign_key: :author_id

  has_many :active_relationships, class_name: 'Following',
                                  foreign_key: 'follower_id',
                                  dependent: :destroy
  has_many :passive_relationships, class_name: 'Following',
                                   foreign_key: 'followed_id',
                                   dependent: :destroy

  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  scope :order_by_most_recent, -> { order(created_at: :desc) }

  def not_following
    User.order_by_most_recent.reject { |user| following.include?(user) || user == self }
  end

  def feed
    Tweet.where(author: (following + [self])).includes(:author)
  end
end
