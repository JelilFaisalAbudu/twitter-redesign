class FollowingsController < ApplicationController
  before_action :set_user

  def create
    @following = current_user.active_relationships.build(followed_id: @user.id)
    if @following.save
      flash[:notice] = "You are now following  @#{@user.username}"
      redirect_to user_path(@user)
    else
      flash[:alert] = 'Something went wrong. Try again.'
      redirect_to root_path
    end
  end

  def destroy
    @following = Following.find_by_follower_id_and_followed_id(current_user, @user)
    if @following.destroy
      flash[:notice] = "You no more follow @#{@user.username}."
      redirect_to user_path(@user)
    else
      flash[:alert] = 'Something went wrong. Try again'
      redirect_to root_path
    end
  end

  private

  def set_user
    @user = User.find(params[:followed_id])
  end
end
