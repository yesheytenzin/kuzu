class SessionsController < ApplicationController
  def create
    @user = User.find_by(params[:email])
    if @user.nil?
      return render json: { error: "user not found" }
    end

    if @user.authenticate(login_params[:password])
      return render json: { login: "successful" }, status: :ok
    else
      return render json: { login: "failed" }, status: :unauthorized
    end
  end

  private
  def login_params
    params.expect(user: [:email, :password])
  end
end
