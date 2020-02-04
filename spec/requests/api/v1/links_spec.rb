require 'rails_helper'

RSpec.describe 'LinksAPI' do
  describe 'GET /api/v1/links' do
    before do
      @user = FactoryBot.create(:user)
      FactoryBot.create_list(:link, 10, user_id: @user.id)
    end

    context 'Not Loggined' do
      it 'is get all Record of Links' do
        get api_v1_links_path
        json = JSON.parse(response.body)

        expect(response.status).to eq(401) #FIXME: 戻り値がおかしいのでAPIのステータス設計を見直す
      end
    end

    context 'On Loggined' do
      it 'is get all Record of Links' do
        post sign_in_path, params: { :session => { :account_id => @user.account_id, :password => @user.password } }
        get api_v1_links_path
        json = JSON.parse(response.body)

        # リクエスト成功を表す200が返ってきたか確認する。
        expect(response.status).to eq(200)

        # 正しい数のデータが返されたか確認する。
        expect(json.length).to eq(10)
      end
    end
  end

  describe 'POST /api/v1/links' do
    context 'Not Loggined' do
      before do
        @headers = { "CONTENT_TYPE" => "application/json" }
      end

      it 'should be 401 Unauthorized' do
        post api_v1_links_path, params: '{ "link": { "url":"http://www.google.co.jp" } }', headers: @headers
        expect(response).not_to be_successful
        expect(response.status).to eq(401)
      end

      it 'should be increment Link' do
        expect { post api_v1_links_path, params: @params }.not_to change(Link, :count)
      end
    end

    context 'Normal Parameter' do
      before do
        @headers = { "CONTENT_TYPE" => "application/json" }
        @user = FactoryBot.create(:user)
        post sign_in_path, params: { :session => { :account_id => @user.account_id, :password => @user.password } }
      end

      it 'should be 201 Created' do
        post api_v1_links_path, params: '{ "link": { "url":"http://www.google.co.jp" } }', headers: @headers
        expect(response).to be_successful
        expect(response.status).to eq(201)
      end

      it 'should be increment Link' do
        expect { post api_v1_links_path, params: '{ "link": { "url":"http://www.google.co.jp" } }', headers: @headers }.to change(Link, :count).by(1)
      end
    end

    context 'Invalid Parameter' do
      before do
        @params = attributes_for(:link, url: '')
        @user = FactoryBot.create(:user)
        post sign_in_path, params: { :session => { :account_id => @user.account_id, :password => @user.password } }
      end

      it 'should be 422 Unprocessable Entity' do
        post api_v1_links_path, params: @params
        expect(response).not_to be_successful
        expect(response.status).to eq(422)
      end

      it 'should be not increment Link' do
        expect { post api_v1_links_path, params: @params }.not_to change(Link, :count)
      end
    end
  end
end
