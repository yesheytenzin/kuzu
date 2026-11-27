class SessionsController < ApplicationController
  include Authenticable

  def create
    @user = User.find_by(email: login_params[:email])
    if @user.nil?
      return render json: { error: "user not found" }
    end

    if @user.authenticate(login_params[:password])
      render json: { token: encode({ user_id: @user.id }), login: "successful" }, status: :ok
    else
      render json: { login: "failed" }, status: :unauthorized
    end
  end

  def destroy
    render json: { logout: "successful" }, status: :ok
  end

  private

  def login_params
    params.expect(user: [ :email, :password ])
  end
end
