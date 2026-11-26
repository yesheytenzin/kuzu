class PostsController < ApplicationController
  before_action :set_post, only: %i[ update destroy show ]
  def index
    @posts = Post.all
    render json: @posts
  end

  def show
    @post = Post.find(params[:id])
    render json: @post
  end

  def create
    @post = current_user.posts.build(post_params)   # user_id set automatically
    if @post.save
      render json: @post, status: :created
    else
      render json: { errors: @post.errors.full_messages }, status: :unprocessable_content
    end
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
    params.expect(post: [ :title, :body ])
  end
end
