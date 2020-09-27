class User < ApplicationRecord
	has_many :tweets, foreign_key: :Author_id

	has_many :active_relationships, class_name: "Following",
																	foreign_key: "Follower_id",
																	dependent: :destroy
	has_many :passive_relationships, class_name: "Following",
																	foreign_key: "Followed_id",
																	dependent: :destroy

	has_many :following, through: :active_relationships, source: :Followed
	has_many :followers, through: :passive_relationships, source: :Follower

	scope :order_by_most_recent, -> { order(created_at: :desc) }

  def not_following
    User.order_by_most_recent.reject { |user| self.following.include?(user) || user == self }
	end
	
	def feed
    Tweet.where(Author: (following + [self])).includes(:Author)
  end
end
