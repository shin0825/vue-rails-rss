class UsersController < ApplicationController
  # skip_before_action :authenticate!, only: [ :create, :sign_in ]
  before_action :set_user, only: :show

  # GET /users/1
  def show
    render json: response_fields(@user.to_json)
  end

  def new
    @user = User.new
  end

  # POST /users
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

  def sign_in
    @user = User.find_by(account_id: params[:account_id])

    if @user&.authenticate(params[:password])
      login @user
      render json: response_fields(@user.to_json)
    else
      render json: { errors: ["ログインに失敗しました。"] }, status: 401
    end
  end

  def sign_out
    logout
  end

  def me
    render json: { errors: [exception] }, status: 201 unless logged_in?
  end

  private

  def user_params
    params.require(:user).permit(:name, :account_id, :password, :password_confirmation)
  end

  def set_user
    @user = User.find_by(id: params[:id])
    # 取得しようとしたユーザが存在しない
    response_not_found(:user) if @user.blank?
  end

  # 他のコントローラでも除外したいフィールドが同じであれば、共通メソッドとして扱っても良い
  def response_fields(user_json)
    user_parse = JSON.parse(user_json)
    # レスポンスから除外したいパラメータ
    response = user_parse.except('password_digest','api_token', 'created_at', 'updated_at')
    # JSON を見やすく整形して返す
    JSON.pretty_generate(response)
  end

end
