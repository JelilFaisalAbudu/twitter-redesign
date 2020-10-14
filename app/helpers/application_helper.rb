module ApplicationHelper
  def display_side_nav
    render '/shared/left_side_navbar' if logged_in?
  end

  def display_top_nav
    if logged_in?
      render 'shared/nav_after_signin'
    else
      render 'shared/signin_or_signup'
    end
  end

  def avatar_for(user)
    avatar = user.photo
    if avatar.attached?
      image_tag(avatar, alt: "@#{user.username}", class: 'profile-pic')
    else
      image_tag('default_avatar.png', alt: "@#{user.username}", class: 'profile-pic')
    end
  end

  def cover_image_for(user)
    cover_image = user.cover_image
    if cover_image.attached?
      image_tag(cover_image, alt: "@#{user.username} ", width: '100%', height: 302)
    else
      image_tag('default_cover.jpg', alt: "@#{user.username}", width: '100%', height: 300)
    end
  end

  def no_following(user)
    return if user.following.count >= 1

    content_tag(:div, class: 'py-4 text-bold') do
      "#{user.username} is not following anyone yet"
    end
  end

  def no_followers(user)
    return if user.followers.count >= 1

    content_tag(:div, class: 'py-4') do
      "#{user.username} has no followers yet"
    end
  end

  def flash_class(level)
    case level.to_sym
    when :notice then 'alert alert-success'
    when :success then 'alert alert-success'
    when :error then 'alert alert-danger'
    when :alert then 'alert alert-danger'
    end
  end
end
