class CommentsController < ApplicationController
  def index
    post = Post.find(params[:post_id])
    @comments = post.comments
    render json: { comments: @comments }, status: :ok
  end

  def show
    @comment = Comment.find(params[:comment_id])

    render json: { comment: @comment }, status: :ok
  end
end
