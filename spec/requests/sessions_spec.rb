require 'rails_helper'

RSpec.describe 'Sessions' do
  describe 'post /sign_in' do
    before do
      @user = FactoryBot.create(:user)
    end

    it 'is success sign_in' do
      post sign_in_path, params: { :session => { :account_id => @user.account_id, :password => @user.password } }
      expect(response.status).to eq(200)
    end

    it 'is error sign_in' do
      post sign_in_path, params: { :session => { :account_id => @user.account_id, :password => "hogehoge" } }
      expect(response.status).to eq(401)
    end
  end
end
