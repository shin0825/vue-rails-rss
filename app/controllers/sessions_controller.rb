class SessionsController < ApplicationController
  def new
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

  private

  def response_fields(user_json)
    user_parse = JSON.parse(user_json)
    # レスポンスから除外したいパラメータ
    response = user_parse.except('password_digest','api_token', 'created_at', 'updated_at')
    # JSON を見やすく整形して返す
    JSON.pretty_generate(response)
  end
end
