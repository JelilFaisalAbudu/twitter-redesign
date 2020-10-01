class TweetsController < ApplicationController
  before_action :authorize_user
  before_action :set_tweet, only: %i[show edit update destroy]

  def index
    @tweets = Tweet.all.includes(:author)
    @feed = current_user.feed.order(created_at: :desc)
    @tweet = current_user.tweets.build
    @who_to_follow = current_user.not_following
  end

  def show; end

  def new
    @tweet = current_user.tweets.build
  end

  def edit; end

  def create
    @tweet = current_user.tweets.build(tweet_params)

    if @tweet.save
      flash[:notice] = 'Your tweet was successfully posted.'
      redirect_to root_path
    else
      flash.now[:alert] = 'Error. Tweet cannot be empty. You can only tweet with ten or more characters.'
      render :new
    end
  end

  # PATCH/PUT /tweets/1
  # PATCH/PUT /tweets/1.json
  def update
    respond_to do |format|
      if @tweet.update(tweet_params)
        format.html { redirect_to @tweet, notice: 'Tweet was successfully updated.' }
        format.json { render :show, status: :ok, location: @tweet }
      else
        format.html { render :edit }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_tweet
    @tweet = Tweet.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def tweet_params
    params.require(:tweet).permit(:text)
  end

  def authorize_user
    return if logged_in?

    flash[:alert] = 'You must sign in first'
    redirect_to sign_in_path
  end
end
