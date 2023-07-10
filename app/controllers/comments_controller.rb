class CommentsController < ApplicationController
    def index
      article_id = params[:article_id]
      comments = Comment.where(article_id: article_id)
      render json: comments
    end

    def create
        article_id = params[:article_id]
        user_id = params[:user_id]
        comments = params[:comments]
    
        comment = Comment.new(article_id: article_id, user_id: user_id, comments: comments)
    
        if comment.save
          render json: comment
        else
          render json: { error: "Error saving comment" }, status: :internal_server_error
        end
    end
    
    def destroy
    article_id = params[:article_id]
    comment_id = params[:comment_id]

    comment = Comment.find_by(id: comment_id, article_id: article_id)

    if comment.nil?
        render json: { error: "Comment not found" }, status: :not_found
    else
        comment.destroy
        render json: { message: "Comment deleted successfully" }
    end
    end
end
  