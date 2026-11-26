class VotesController < ApplicationController
  def score
    votes = Vote.where(votable_id: params[:id])
    render json: votes.where(vote_type: "upvote").count - votes.where(vote_type: "downvote").count
  end

  def vote
    @vote = Vote.find_by(votable_id: params[:id], user_id: current_user.id)
    if @vote
      if params[:vote_type] == @vote.vote_type
        @vote.destroy
      else
        @vote.update!(vote_type: params[:vote_type])
      end
    else
      @vote = Vote.create!(
        user_id: current_user.id.to_s,
        votable_id: params[:id],
        votable_type: params[:votable_type],
        vote_type: params[:vote_type]
      )
    end
  end
end
