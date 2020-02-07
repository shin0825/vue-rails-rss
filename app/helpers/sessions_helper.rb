module SessionsHelper
  def login(user)
    session[:user_id] = user.id
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    current_user.present?
  end

  def authenticate_user
    response_unauthorized unless logged_in?
  end

  def logout
    session.delete(:user_id)
    @current_user = nil
  end

  def response_fields(user_json)
    user_parse = JSON.parse(user_json)
    # レスポンスから除外したいパラメータ
    response = user_parse.except('password_digest','api_token', 'created_at', 'updated_at')
    # JSON を見やすく整形して返す
    JSON.pretty_generate(response)
  end
end
