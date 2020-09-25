module ApplicationHelper
	# def session_check_for(current_user)
  #   if current_user
  #     render 'shared/user_info'

  #   else
  #     link_to 'Sign in', user_session_path
  #   end
	# end
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
end
