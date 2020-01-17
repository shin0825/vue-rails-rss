class UsersController < ApplicationController
  before_action :set_user, only: :show

  def show
    render json: response_fields(@user.to_json)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.name.blank?
      # 必須パラメータが欠けている場合
      response_bad_request
    else
      if User.exists?(account_id: @user.account_id)
        # 既に登録済みのメールアドレスで登録しようとした場合
        response_conflict(:user)
      else
        if @user.save
          login @user
          # ユーザ登録成功
          response_success(:user, :create)
        else
          # 何らかの理由で失敗
          response_internal_server_error
        end
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :account_id, :password, :password_confirmation)
  end

  def set_user
    @user = User.find_by(id: params[:id])
    response_not_found(:user) if @user.blank?
  end
end
