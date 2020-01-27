require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with a name, account_id, and password_digest" do
    user = User.new(
      name: "nyanpoko",
      account_id: "1",
      password_digest: "hogefuga",
    )
    expect(user).to be_valid
  end

  # TODO: ファクトリの作成
  it "is invalid duplicate account_id" do
    user = FactoryBot.create(:user, account_id: "hoge")
    dup_user = User.new(
      name: "nyanpoko",
      account_id: "hoge",
      password_digest: "hogefuga",
      api_token: "aeonginko"
    )
    expect(dup_user).to_not be_valid
  end
end
