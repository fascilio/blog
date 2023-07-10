class UsersController < ApplicationController
    #  skip_before_action :require_login, except: [:create, :logout]
rescue_from ActiveRecord::RecordInvalid, with: :invalid_response
    # skip_before_action :verify_authenticity_token, only: [:create, :authenticate]
    # before_action :require_login, except: [:login, :authenticate]
    # protect_from_forgery with: :exception, except: [:authenticate]
    # # before_action :require_login

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
    # def create
    #     user = User.new(user_params)
    
    #     if user.save
    #       redirect_to articles_path
    #     else
    #       redirect_to signup_path
    #     end
    # end
  
    # def login
    #     render :login
    # end

    # def require_login
    #     unless session[:user_id]
    #       flash[:error] = "You must be logged in to access this page."
    #       redirect_to login_path
    #     end
    # end
  
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
# class UsersController < ApplicationController
#     # skip_before_action :require_login, except: [:logout]
  
#     def new
#       user = User.new
#       render json: user
#     end
  
#     def create
#       user = User.new(user_params)
  
#       if user.save
#         session[:user_id] = user.id
#         render json: user
#       else
#         render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
#       end
#     end
  
#     # def login
#     #   # Render the login form view
#     #   render :login
#     # end
  
#     def authenticate
#       user = User.find_by(email: params[:email])
  
#       if user && user.authenticate(params[:password])
#         session[:user_id] = user.id
#         render json: { message: 'Login successful' }, status: :success
#       else
#         render json: { error: 'Invalid email or password' }, status: :unauthorized
#       end
#     end
  
#     def logout
#       session.delete[:user_id] 
#       render json: { message: 'Logged out successfully' }
#     end
  
#     private
  
#     def user_params
#       params.permit(:firstname, :secondname, :username, :email, :password, :password_confirmation)
#     end
#   end
  
  