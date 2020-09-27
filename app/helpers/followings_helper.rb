module FollowingsHelper
	def display_follow_button_for(user)
		if user != current_user && !following?(user)
		link_to '<i class="fas fa-plus" data-toggle="tooltip" data-placement="top" title="Follow"></i>'.html_safe, follow_user_path(Followed_id: user), method: :post
		end
	end

	def display_unfollow_button_for(user)
		if user != current_user && following?(user)
			link_to '<i class="fas fa-minus" data-toggle="tooltip" data-placement="top" title="Unfollow">
			</i>'.html_safe, unfollow_user_path(Follower_id: current_user, Followed_id: user), method: :delete
		end
	end
	private

	def following?(user)
		current_user.following.include?(user)
	end
end
