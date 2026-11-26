class VotesController < ApplicationController
  def score
    votes = Vote.where(votable_id: params[:id])
    render json: votes.where(vote_type: "upvote").count - votes.where(vote_type: "downvote").count
  end

  def vote
    @vote = Vote.find_by(params[:id])
    if @vote.exists?
      if params[:vote_type] == @vote.vote_type
        toggle_vote
      else
        undo_vote
      end
    else
      @vote = Vote.new(user: current_user, votable_id: params[:id], votable_type: params[:votable_type], vote_type: params[:vote_type])
    end
  end

  private

  def undo_vote
    @vote.destroy
  end

end
