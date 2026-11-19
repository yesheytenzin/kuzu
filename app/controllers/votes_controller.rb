class VotesController < ApplicationController
  def count
    render json: Vote.where(votable_id: params[:id]).count
  end
end
