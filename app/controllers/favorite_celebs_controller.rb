class FavoriteCelebsController < ApplicationController
    
    def create
        @favorite_celeb= FavoriteCeleb.create(params[favorite_celeb_params])
        @favorite_celeb.save
    end

    
    def show
        @favorite_celebs = FavoriteCeleb.select{|record| record.user_id = params[:user_id]}
        render json: @favorite_celebs
    end

    # def show_by_celeb
    #     @favorite_celeb = FavoriteCeleb.find(params[:favorite_celeb_params])
    #     render json: @favorite_celeb
    # end

    # def show
    #     @favorite_celeb = FavoriteCeleb.find(params[:favorite_celeb_params])
    #     render json: @favorite_celeb
    # end

    def delete
        @favorite_celeb = FavoriteCeleb.find(params[favorite_celeb_params])
        @favorite_celeb.destroy()
    end

    def logout_remove
        @favorite_celebs = FavoriteCeleb.select{|record| record.user_id == params[:user_id]}
        @favorite_celebs.each(&:destroy)
    end



    private
    def favorite_celeb_params
        params.require(:favorite_celeb).permit(:user_id,:celeb_id)
    end
end
