class Api::V1::LinksController < ApplicationController
  before_action :set_link, only: [:show, :edit, :update, :destroy]
  # before_action :twitter_client, only: [:create]
  before_action :set_target_date, only: :index
  before_action :authenticate_user, only: [:new, :edit, :create, :update, :destroy]
  rescue_from Exception, with: :render_status_500
  rescue_from ActiveRecord::RecordNotFound, with: :render_status_404

  def index
    if @targetDate
      links = Link.select(:id, :title, :url, :tweet_url, :created_at, :user_id).where(created_at: @targetDate.in_time_zone.all_month).order_by_created_at_desc
    else
      links = Link.select(:id, :title, :url, :tweet_url, :created_at, :user_id).order_by_created_at_desc
    end
    render json: links.to_json(:include => [{user: {only: [:account_id, :name]}}])
  end

  def show
    render json: @link.to_json(:include => [{user: {only: [:account_id, :name]}}])
  end

  def new
    @link = Link.new
  end

  def edit

  end

  def create
    link = current_user.links.build(link_params)

    if link.save
      @client.update("bot: 記事メモった https://nameless-tundra-72223.herokuapp.com/#/ \r")
      # render json: link, status: :created
      response_created(:link)
    else
      render json: { errors: link.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update

  end

  def destroy
    if current_user_id?(@link.user_id)
      @link.destroy
      response_success(:link, :delete)
    else
      render json: { errors: "ユーザーが異なっています" }, status: :unprocessable_entity
    end
  end

  private
    def set_target_date
      if params[:year].present? && params[:month].present?
        @targetDate = Time.zone.local(params[:year], params[:month], 1)
      else
        @targetDate = Time.zone.now
      end
    end

    def link_params
      params.fetch(:link, {}).permit(:title, :url)
    end

    def set_link
      @link = Link.find(params[:id])
    end

    def render_status_404(exception)
      render json: { errors: [exception] }, status: 404
    end

    def render_status_500(exception)
      render json: { errors: [exception] }, status: 500
    end

    def twitter_client
      @client = Twitter::REST::Client.new do |config|
        config.consumer_key        = ENV['api_key']
        config.consumer_secret     = ENV['api_secret_key']
        config.access_token        = ENV['access_token']
        config.access_token_secret = ENV['access_token_secret']
      end
    end
end
