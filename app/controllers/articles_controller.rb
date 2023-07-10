class ArticlesController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :invalid_response
    rescue_from ActiveRecord::RecordNotFound, with: :not_found_response
    before_action :require_login, only: [:create, :update, :destroy]
  
    def index
      articles = Article.all
      render json: articles
    end
  
    def show
      article = Article.find(params[:id])
      render json: article
    end
  
    def create
      user = User.find(session[:user_id])
      user.articles.create!(article_params)
    end
  
    def update
      article = Article.find(params[:id])
      article.update!(article_params)
      render json: article
    end
  
    def destroy
      article = Article.find(params[:id])
      article.destroy
      head :no_content
    end

    def interaction
      article_id = params[:article_id]
      user_id = params[:user_id]
      interaction_type = params[:interaction_type] # Should be either 'like' or 'dislike'
  
      like = Like.new(article_id: article_id, user_id: user_id, interaction_type: interaction_type)
  
      if like.save
        render json: like
      else
        render json: { error: "Error saving like" }, status: :internal_server_error
      end
    end
  
    private

    def not_found_response
      render json: {error: "Article not found"}, status: :not_found
    end
  
    def article_params
      params.require(:article).permit(:title, :category, :content)
    end

    def invalid_response(invalid)
      render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end
  
    def require_login
      unless session[:user_id]
        render json: { error: 'You must be logged in to create an article.' }, status: :unauthorized
      end
    end
end
  