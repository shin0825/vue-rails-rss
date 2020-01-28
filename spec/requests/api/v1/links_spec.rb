require 'rails_helper'

RSpec.describe 'LinksAPI' do
  it 'is get all Record of Links' do
    FactoryBot.create_list(:link, 10)

    get '/api/v1/links'
    json = JSON.parse(response.body)

    # リクエスト成功を表す200が返ってきたか確認する。
    expect(response.status).to eq(200)

    # 正しい数のデータが返されたか確認する。
    expect(json.length).to eq(10)
  end
end
