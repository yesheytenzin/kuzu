class MembershipsController < ApplicationController
  def create
    @membership = CommunityMembership.create!(membership_params)
      render json: @membership, status: :ok
  end

  private
  def membership_params
    params.expect(communityMembership: [ user_id: current_user ])
  end
end
