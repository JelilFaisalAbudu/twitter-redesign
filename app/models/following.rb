class Following < ApplicationRecord
  belongs_to :Follower, class_name: 'User'
  belongs_to :Followed, class_name: 'User'
end
