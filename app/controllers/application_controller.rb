class ApplicationController < ActionController::Base
  include ActionController::HttpAuthentication::Token::ControllerMethods

  protect_from_forgery with: :null_session
  before_action :authenticate!

  private

  def authenticate!
    authenticate_or_request_with_http_token do |token, options|
      User.find_by(api_token: token).present?
    end
  end

  def current_user
    @current_user ||= User.find_by(api_token: request.headers['Authorization'].split[1])
  end
end
