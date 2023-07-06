class CommentsController < ApplicationController
    def index
      article_id = params[:article_id]
      comments = Comment.where(article_id: article_id)
      render json: comments
    end
  end
  