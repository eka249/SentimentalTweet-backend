class TwitterAccountsController < ApplicationController
    def index
        twitter_accounts = TwitterAccount.all
        render json: twitter_accounts
    end

    def show
        twitter_account = TwitterAccount.find(params[:id])
        render json: twitter_account
    end

    def create
    end

    def destroy
    end
end
