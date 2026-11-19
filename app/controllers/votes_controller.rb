class VotesController < ApplicationController
  def score
    votes = Vote.where(votable_id: params[:id])
    render json: votes.where(vote_type: "upvote").count - votes.where(vote_type: "downvote").count
  end
end
