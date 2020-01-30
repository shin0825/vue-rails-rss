require 'rails_helper'

RSpec.describe 'LinksAPI' do
  describe 'GET /api/v1/links' do
    it 'is get all Record of Links' do
      FactoryBot.create_list(:link, 10)

      get api_v1_links_path
      json = JSON.parse(response.body)

      # リクエスト成功を表す200が返ってきたか確認する。
      expect(response.status).to eq(200)

      # 正しい数のデータが返されたか確認する。
      expect(json.length).to eq(10)
    end
  end

  describe 'POST /api/v1/links' do
    context 'Normal Parameter' do
      before do
        @headers = { "CONTENT_TYPE" => "application/json" }
      end

      it 'should be 201 Created' do
        post api_v1_links_path, params: '{ "link": { "url":"http://www.google.co.jp" } }', headers: @headers
        # TODO: 右のコードを復活させる expect(response).not_to be_success
        expect(response.status).to eq(201) # TODO: 戻り値が200なので修正する
      end

      it 'should be increment Link' do
        expect { post api_v1_links_path, params: '{ "link": { "url":"http://www.google.co.jp" } }', headers: @headers }.to change(Link, :count).by(1)
      end
    end

    context 'Invalid Parameter' do
      before do
        @params = attributes_for(:link, url: '')
      end

      it 'should be 422 Unprocessable Entity' do
        post api_v1_links_path, params: @params
        # TODO: 右のコードを復活させる expect(response).not_to be_success
        expect(response.status).to eq(422)
      end

      it 'should be not increment Link' do
        expect { post api_v1_links_path, params: @params }.not_to change(Link, :count)
      end
    end
  end
end
