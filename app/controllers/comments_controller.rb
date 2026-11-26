class CommentsController < ApplicationController
  before_action :set_comment, only: %i[show update destroy]

  def index
    @post = Post.find(params[:post_id]) # TODO: Add Pagination
    @comments = @post.comments

    render json: { comments: @comments }, status: :ok
  end

  def show
    render json: { comment: @comment }, status: :ok
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.post_id = params[:post_id]
    @comment.user = current_user

    if @comment.save
      render json: { comment: @comment }, status: :created
    else
      render json: { errors: @comment.errors.full_messages }, status: :unprocessable_content
    end
  end

  def update
    if @comment.update(comment_params)
      render json: { comment: @comment }, status: :ok
    else
      render json: { errors: @comment.errors.full_messages }, status: :unprocessable_content
    end
  end

  def destroy
    if @comment.destroy
      head :no_content
    else
      render json: { errors: @comment.errors.full_messages }, status: :unprocessable_content
    end
  end

  private

  def set_comment
    @comment = Comment.find_by(id: params[:id])
    render json: { error: "Comment does not exist" }, status: :not_found unless @comment
  end

  def comment_params
    params.expect(comment: [:body, :post_id])
  end
end
