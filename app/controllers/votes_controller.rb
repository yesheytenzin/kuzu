class VotesController < ApplicationController
  before_action :set_post, only: [:posts]
  before_action :set_comment, only: [:comments]

  def comments
    render json: Vote.where(votable:@comment).count
  end

  def increase_vote_count
  end
  def posts
    render json: Vote.where(votable:@post).count
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end
end
