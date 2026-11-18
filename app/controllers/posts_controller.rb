class PostsController < ApplicationController
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
  end

  def destroy
  end

end
