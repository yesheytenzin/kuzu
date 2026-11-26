class MembershipsController < ApplicationController
  def create
    community = Community.find(params[:community_id])
    membership = CommunityMembership.new(user: current_user, community: community)

    if membership.save
      render json: membership, status: :created
    else
      render json: { errors: membership.errors.full_messages }, status: :unprocessable_entity
    end
  end
end
