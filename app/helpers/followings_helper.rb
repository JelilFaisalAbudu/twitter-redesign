module FollowingsHelper
  # rubocop:disable Layout/LineLength

  def display_follow_button_for(user)
    return unless user != current_user && !following?(user)

    link_to '<i class="fas fa-plus" data-toggle="tooltip" data-placement="top" title="Follow"></i>'.html_safe, follow_user_path(followed_id: user), method: :post
  end

  def display_unfollow_button_for(user)
    return unless user != current_user && following?(user)

    link_to '<i class="fas fa-minus" data-toggle="tooltip" data-placement="top" title="Unfollow"></i>'.html_safe, unfollow_user_path(follower_id: current_user, followed_id: user), method: :delete
  end

  private

  def following?(user)
    current_user.following.include?(user)
  end

  # rubocop:enable Layout/LineLength
end
