require 'mechanize'

class Api::V1::EmployeesController < ApiController
  # ActiveRecordのレコードが見つからなければ404 not foundを応答する
  rescue_from ActiveRecord::RecordNotFound do |exception|
    render json: { error: '404 not found' }, status: 404
  end

  def index
    me = Mechanize.new
    yahoo = me.get("https://blog.mmmcorp.co.jp/blog/2019/12/25/lambda-cloud-bankruptcy/")
    yahoo_t = yahoo.search('title').to_s
    render json: yahoo_t
  end
end
