class AuthController < ApplicationController
  skip_before_action :authorized, only: [:create]


  def create
    # byebug
    @user = User.find_by(username: user_login_params[:username])
    #User#authenticate comes from BCrypt
    puts @user
    puts "password/username below"
    puts user_login_params[:password]
    puts user_login_params[:username]
    if @user && @user.authenticate(user_login_params[:password])
      puts "got to the else statement"
      # encode token comes from ApplicationController
      token = encode_token({ user_id: @user.id })
      render json: { user: UserSerializer.new(@user), jwt: token }, status: :accepted
      puts "passed the if statement"
    else
      puts "got to the else statement"
      render json: { message: 'Invalid username or password' }, status: :unauthorized
      puts "got to the else statement"
    end
  end

  def show
    token = request.headers['Authorization']
    user = User.find_by(id: token)
    if logged_in?
      render json: {id: current_user.id, username: current_user.username}
    else render json: {error: 'No user could be found'}, status: 401
    end
  end
  
 
  private
 
  def user_login_params
    params.require(:auth).permit(:username, :password)
  end
end