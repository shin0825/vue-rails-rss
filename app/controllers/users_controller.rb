class UsersController < ApplicationController
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user
    else
      render json: { errors: @user.errors.full_messages }, status: 400
    end
  end

  def sign_in
    @user = User.find_by(account_id: params[:account_id])

    if @user&.authenticate(@params[:password])
      render json: @user
    else
      render json: { errors: ['ログインに失敗しました。'] }, status: 401
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :account_id, :password, :password_confirmation)
  end
end
