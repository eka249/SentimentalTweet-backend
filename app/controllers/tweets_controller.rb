class TweetsController < ApplicationController
    def index
        tweets = Tweet.all
        render json: tweets
    end

    def show
        tweet = Tweet.find(params[:id])
        render json: tweet
    end

    def create
        
    end

    def get_tweet
        
    end


    def update
        tweet = Tweet.find(params[tweet_params])
        byebug
    end

    def destroy
    end

    private

    def tweet_params
        params.require(:tweet).permit(:content,:sentiment, :celeb_username)
    end
end
