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
  it "アカウントidが重複している場合、エラーになること" do

  end
end
