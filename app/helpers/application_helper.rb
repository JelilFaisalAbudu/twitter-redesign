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
end
