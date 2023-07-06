class ArticlesController < ApplicationController
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
      article = current_user.articles.build(article_params)
      if article.save
        render json: article, status: :created
      else
        render json: { error: article.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    def update
      article = Article.find(params[:id])
      if article.update(article_params)
        render json: article
      else
        render json: { error: article.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    def destroy
      article = Article.find(params[:id])
      article.destroy
      render json: { message: 'Article was successfully destroyed.' }
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
  
    def article_params
      params.require(:article).permit(:title, :category, :content)
    end
  
    def require_login
      unless current_user
        render json: { error: 'You must be logged in to create an article.' }, status: :unauthorized
      end
    end
end
  