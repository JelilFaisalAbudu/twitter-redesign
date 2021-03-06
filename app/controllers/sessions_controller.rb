class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(username: params[:session][:username])
    if user
      # log the user in and direct to show page
      log_in(user)
      flash[:notice] = 'Welcome back...'
      redirect_to root_path
    else
      flash.now[:alert] = 'Invalid username. Try again' # Log in not
      render 'new' # Try once more
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = 'You have logged out.'
    redirect_to sign_in_path
  end
end
