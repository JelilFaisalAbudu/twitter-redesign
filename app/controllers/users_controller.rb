class UsersController < ApplicationController
  before_action :set_user, only: %i[edit update show destory]

  def new
    @user = User.new
  end

  def show; end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in(@user)
      flash[:notice] = 'You have successfully registered'
      redirect_to root_path
    else
      flash.now[:error]
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :full_name, :photo, :cover_image)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
