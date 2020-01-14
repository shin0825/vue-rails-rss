class Api::V1::LinksController < ApplicationController
  before_action :set_link, only: [:show, :edit, :update, :destroy]
  before_action :set_target_date, only: :index
  # skip_before_action :authenticate!, only: [ :index, :show ]

  # 拾えなかったExceptionが発生したら500 Internal server errorを応答する
  rescue_from Exception, with: :render_status_500

  # ActiveRecordのレコードが見つからなければ404 not foundを応答する
  rescue_from ActiveRecord::RecordNotFound, with: :render_status_404

  def index
    links = Link.select(:id, :title, :url, :created_at).order_by_created_at_desc
    render json: links
  end

  def show
    render json: @link
  end

  def new
    @link = Link.new
  end

  def edit

  end

  def create
    link = Link.new(link_params)

    if link.save
      render json: link, status: :created
    else
      render json: { errors: link.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update

  end

  def destroy

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
end
