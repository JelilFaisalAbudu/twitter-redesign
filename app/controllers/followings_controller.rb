class FollowingsController < ApplicationController
  before_action :set_user

  def create
    @following = current_user.active_relationships.build(Followed_id: @user.id)
    if @following.save
      flash[:notice] = 'You are now following this user'
      redirect_to user_path(@user)
    else
      flash[:alert] = 'Something went wrong. Try again.'
      redirect_to root_path
    end
  end

  def destroy
    @following = Following.find_by_Follower_id_and_Followed_id(current_user, @user)
    if @following.destroy
      flash[:notice] = 'You no more follow this user.'
      redirect_to user_path(@user)
    else
      flash[:alert] = 'Something went wrong. Try again'
      redirect_to root_path
    end
  end

  private

  def set_user
    @user = User.find(params[:Followed_id])
  end
end
