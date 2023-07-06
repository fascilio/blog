class SessionsController < ApplicationController
    def create
      # user = User.new(username: params[:username], password: params[:password])
  
      # if user.save
      #   session[:user_id] = user.id
      #   render json: user
      # else
      #   render json: { error: 'Invalid username' }, status: 401
      # end
    user = User.find_by!(email: params[:email])
  
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        render :login
      else
        render json: { error: 'Invalid username, email, or password' }, status: :unauthorized
      end
    end
  
    def destroy
      session.delete(:user_id)
      head :no_content
    end
  end