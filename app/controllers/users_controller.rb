class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show, :destory]

  def new
    @user = User.new
  end

  def show
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'You have successfully registered'
      redirect_to root_path
    else
      flash.now[:error] = 'Something went wrong'
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:Username, :FullName, :Photo, :CoverImage)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
