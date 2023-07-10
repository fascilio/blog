class SessionsController < ApplicationController
  # skip_before_action :verify_authenticity_token, only: [:create, :authenticate]
    # before_action :require_login, except: [:login, :authenticate]
    # protect_from_forgery with: :exception, except: [:authenticate]

    def create
    user = User.find_by!(email: params[:email])
  
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        render json: user
      else
        render json: { error: 'Invalid email, or password' }, status: :unauthorized
      end
    end
  
    def destroy
      session.delete(:user_id)
      head :no_content
    end

    private

    def authenticate
      
    end
  end