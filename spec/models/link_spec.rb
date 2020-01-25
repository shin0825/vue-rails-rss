require 'rails_helper'

RSpec.describe Link, type: :model do
  # TODO: ファクトリの作成
  it "正しいURLでない場合、エラーになること" do
    link = Link.new(
      url: "ttp://www.yahoo.co.jp"
    )
    expect(link).to_not be_valid
  end
end
