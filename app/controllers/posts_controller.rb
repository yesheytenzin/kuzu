class PostsController < ApplicationController
  before_action :set_post, only: %i[ update delete show ]
  def index
    @posts = Post.all
  end

  def show
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      render json: @post status: 'ok'
    else
      render json: {error: "Failed to create post!"}, status: :unprocessable_entity
  end

  def update
    if @post.update(post_params)
      render json: @post, status: :ok
    else
      render json: { error: "failed to update post" }, status: :unprocessable_content
    end
  end

  def destroy
    if @post.destroy
      render json: "post deleted", status: ok
    else
      render json: { error: "failed to delete post" }, status: :unprocessable_entity
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.expect(product: [:title, :body, user_id: current_user.id])
  end

end
