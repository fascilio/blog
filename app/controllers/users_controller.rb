class UsersController < ApplicationController
    skip_before_action :require_login, except: [:logout]
    skip_before_action :verify_authenticity_token, only: [:create]
  
    def new
      user = User.new
      render json: user
    end
  
    def create
      user = User.new(user_params)
  
      if user.save
        session[:user_id] = user.id
        render json: user
      else
        render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    def login
        render :login
    end
  
    def authenticate
      user = User.find_by(email: params[:email], password: params[:password])
  
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        render :login
      else
        render json: { error: 'Invalid username, email, or password' }, status: :unauthorized
      end
    end
  
    def logout
      session.delete[:user_id] 
      render json: { message: 'Logged out successfully' }
    end
  
    private
  
    def user_params
      params.require(:user).permit(:firstname, :secondname, :username, :email, :password, :password_confirmation)
    end
  end
  