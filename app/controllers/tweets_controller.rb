class TweetsController < ApplicationController

  def index
    sleep 2
    @tweets = Tweet.all
  end

  def show

  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
      flash[:notice] = "Tweet successfully added!"
      respond_to do |format|
        format.html { redirect_to tweets_path }
        format.js
      end
    else
      respond_to do |format|
        format.html { render :new }
        format.js
      end
    end
  end

  def destroy
    @tweet = Tweet.find(params[:id]).destroy()
    respond_to do |format|
      format.html { redirect_to tweets_path }
      format.js
    end
  end

  private
    def tweet_params
      params.require(:tweet).permit(:tweet_text)
    end
end
