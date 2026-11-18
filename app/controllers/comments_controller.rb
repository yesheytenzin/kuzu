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

  def create
    @comment = Comment.new
    @comment.post_id = params[:post_id]
    @comment.user = current_user
    @comment.body = params[:body]
    if @comment.save
        render json: { comment: @comment }, status: :ok
    else
      render json: { error: @comment.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    @comment = Comment.find(params[:comment_id])
    @comment.body = params[:body]
    if @comment.save
        render json: { comment: @comment }, status: :ok
    else
      render json: { error: @comment.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @comment = Comment.find(params[:comment_id])
    if @comment.destroy
      render json: { comment: @comment }, status: :ok
    else
      render json: { error: @comment.errors.full_messages }, status: :unprocessable_entity
    end
  end
end
