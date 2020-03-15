require 'rails_helper'

RSpec.describe 'LinksAPI' do
  describe 'GET /api/v1/users/:account_id' do
    before do
      @user = FactoryBot.create(:user)
      @other_user = FactoryBot.create(:other_user)
      FactoryBot.create_list(:link, 10, user_id: @user.id)
    end

    context 'By Original User' do
      it 'is get all Record of Links by User' do
        get api_v1_user_path(@user.account_id)
        json = JSON.parse(response.body)

        # リクエスト成功を表す200が返ってきたか確認する。
        expect(response.status).to eq(200)

        # 正しい数のデータが返されたか確認する。
        expect(json.length).to eq(10)
      end
    end

    context 'By Other User' do
      it 'is not get Record of Links by User' do
        get api_v1_user_path(@other_user.account_id)
        json = JSON.parse(response.body)

        # リクエスト成功を表す200が返ってきたか確認する。
        expect(response.status).to eq(200)

        # 正しい数のデータが返されたか確認する。
        expect(json.length).to eq(0)
      end
    end
  end
end
