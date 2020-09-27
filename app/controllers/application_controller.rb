class ApplicationController < ActionController::Base
  include SessionsHelper

  def require_user
    return if logged_in?

    flash[:alert] = 'You must be logged in to perform this operation'
    redirect_to login_path
  end
end
