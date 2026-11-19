class VotesController < ApplicationController
  def count
    votes = Vote.where(votable_id: params[:id])
    if params[:vote_type] == "upvote"
      render json: votes.where(vote_type: "upvote").count
    else
      render json: votes.where(vote_type: "downvote").count
    end
  end
end
