class TweetsController < ApplicationController

  def index
    sleep 1
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
      # flash[:notice] = "Tweet successfully added!"
      respond_to do |format|
        format.html { redirect_to tweets_path }
        format.js { flash.now[:notice] = "Tweet successfully added!" }
      end
    else
      respond_to do |format|
        format.html { render :new }
        format.js { flash.now[:alert] = "Error in new tweet entry. Try again." }
      end
    end
  end

  def destroy
    @tweet = Tweet.find(params[:id]).destroy()
    respond_to do |format|
      format.html { redirect_to tweets_path }
      format.js { flash.now[:notice] = "Tweet successfully deleted!" }
    end
  end

  private
    def tweet_params
      params.require(:tweet).permit(:tweet_text)
    end
end
