class FavoriteCelebsController < ApplicationController
    
    def create
        @favorite_celeb= FavoriteCelebsController.create(favorite_celeb_params)
    end

    
    def index
        @favorite_celebs = FavoriteCeleb.all
        render json: favorite_celebs
    end

    def show
        @favorite_celeb = FavoriteCeleb.find(params[:favorite_celeb_params])
        render json: favorite_celeb
    end

    # def update
    #     byebug
    # end

    def delete
        @favorite_celeb = FavoriteCeleb.find(params[:favorite_celeb_params])
        @favorite_celeb.destroy()
    end


    private
    def favorite_celeb_params
        params.require(:favorite_celeb).permit(:user_id, :celeb_id)
    end
end
