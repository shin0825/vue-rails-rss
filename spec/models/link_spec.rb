require 'rails_helper'

RSpec.describe Link, type: :model do
  # TODO: ファクトリの作成
  it "is valid normal URL" do
    link = Link.new(
      url: "http://www.yahoo.co.jp"
    )
    expect(link).to be_valid
  end

  it "is valid normal URL(#)" do
    link = Link.new(
      url: "http://www.yahoo.co.jp/#/"
    )
    expect(link).to be_valid
  end

  it "is valid normal URL(@)" do
    link = Link.new(
      url: "https://qrunch.net/@jintz/entries/aqEyxcCJb7HDVAQp"
    )
    expect(link).to be_valid
  end

  it "is valid normal URL(?=)" do
    link = Link.new(
      url: "https://dev.classmethod.jp/?s=Azure"
    )
    expect(link).to be_valid
  end

  it "is invalid wrong URL" do
    link = Link.new(
      url: "ttp://www.yahoo.co.jp"
    )
    expect(link).to_not be_valid

    link = Link.new(
      url: "http://www.yahoo.co.jp<"
    )
    expect(link).to_not be_valid
  end
end
