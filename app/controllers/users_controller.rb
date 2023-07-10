class UsersController < ApplicationController
   
rescue_from ActiveRecord::RecordInvalid, with: :invalid_response

   def index
        users = User.all
        render json: users
    end

    def new
      user = User.new
      render json: user
    end
  
    def create
      user = User.create!(user_params)
        session[:user_id] = user.id
        render json: user, status: :created
    
    end
  
    def authenticate
      user = User.find_by(email: params[:email])
  
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
      params.permit(:firstname, :secondname, :username, :email, :password, :password_confirmation)
    end

    def require_login
        unless current_user
          redirect_to login_path, alert: "Please log in to continue."
        end
    end

    def invalid_response(invalid)
      render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
      
    end
  end

  