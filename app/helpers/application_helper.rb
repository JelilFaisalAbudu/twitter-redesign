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

end
