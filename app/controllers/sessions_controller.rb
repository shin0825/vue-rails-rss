class SessionsController < ApplicationController
  def new
    response_success("sessions", "new").to_json
  end

  def show
    if logged_in?
      render json: response_fields(current_user.to_json)
    else
      render json: nil
    end
  end

  def create
    user = User.find_by(account_id: params[:session][:account_id])
    if user&.authenticate(params[:session][:password])
      login user
      render json: response_fields(user.to_json)
    else
      render json: { errors: ["ログインに失敗しました。"] }, status: 401
    end
  end

  def destroy
    logout
  end
end
