class FavoriteAccountsController < ApplicationController
    def index
        favorite_accounts = FavoriteAccount.all
        render json: favorite_accounts
    end

    def show
        favorite_account = FavoriteAccount.find(params[:favorite_account_params])
        render json: favorite_account
    end

    # def update
    #     byebug
    # end

    private
    def favorite_account_params
        params.require(:favorite_account).permit(:user_id, :twitter_account_id)
    end
end
