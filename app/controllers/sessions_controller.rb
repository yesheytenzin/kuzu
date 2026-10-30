class SessionsController < ApplicationController
  def create
    render json: { some: "thing" }
  end
end
