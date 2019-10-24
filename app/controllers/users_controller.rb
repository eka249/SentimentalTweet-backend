class UsersController < ApplicationController

    before_action :user_params, only: [:create]
    skip_before_action :authorized, only: [:create]

    def index
        users = User.all
        render json: users
    end

    # def show
    #     @user= User.find(user_params)
    #     render json: user
    # end

    def profile
        render json: {user: UserSerializer.new(current_user)}, status: :accepted
    end

    def show
        render json: {user: UserSerializer.new(current_user)}, status: :accepted
    end

    def create
        # puts "reached create on backend"
        # byebug
        # @user = User.create(user_params)
        @user = User.create(name: params[:name], username: params[:username], password: params[:password])
        # byebug
        if @user.valid?
            @token = encode_token({user_id: @user.id})
            render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
            # puts "passed @user.valid? in users controller"
        else
            render json: {error: "failed to create user #{params[:username]}"}, status: :not_acceptable
            # puts "passed @user.valid? and failed in users controller"
        end
    end

    def update
        @user = User.find(params[:id])
        @user.update(name: params[:name])
        @user.save
        render json: @user
        # redirect_to @profile
    end

    def delete
        @user = User.find(params[:id])
        @user.destroy()
        
        # redirect_to @profile
    end




    private

    def user_params
        # params.require(:username,:name,:password)
        params.require(:user).permit(:username,:name,:password)
    end
end

