class Api::V1::UsersController < ApplicationController

  def create
    @user = User.new(user_params)
    if @user.name.blank?
      # 必須パラメータが欠けている場合
      response_bad_request
    else
      if User.exists?(account_id: @user.account_id)
        render status: 409, json: { status: 409, errors: { account_id: { msg: "User Account ID Conflict" } } }
      else
        if @user.save
          login @user
          render json: response_fields(@user.to_json)
        else
          # 何らかの理由で失敗
          response_internal_server_error
        end
      end
    end
  end

  private

  def user_params
    params.permit(:account_id, :name, :password, :password_confirmation)
  end

end
