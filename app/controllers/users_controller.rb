class UsersController < ApplicationController
  skip_before_action :authenticate!, only: [ :create, :sign_in ]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user
    else
      render json: { errors: @user.errors.full_messages }, status: 400
    end
    # render :new unless @user.save
  end

  def sign_in
    @user = User.find_by(account_id: params[:account_id])

    if @user&.authenticate(params[:password])
      render json: @user
    else
      render json: { errors: ["ログインに失敗しました。"] }, status: 401
    end
  end

  def me
    render json: current_user
  end

  private

  def user_params
    params.require(:user).permit(:name, :account_id, :password, :password_confirmation)
  end
end
