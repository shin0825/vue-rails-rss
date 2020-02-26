class Api::V1::LinksController < ApplicationController
  before_action :set_link, only: [:show, :edit, :update, :destroy]
  before_action :set_target_date, only: :index
  before_action :authenticate_user, only: [:index, :show, :new, :edit, :create, :update, :destroy]
  rescue_from Exception, with: :render_status_500
  rescue_from ActiveRecord::RecordNotFound, with: :render_status_404

  def index
    if @targetDate
      links = current_user.links.select(:id, :title, :url, :tweet_url, :created_at).where(created_at: @targetDate.in_time_zone.all_month).order_by_created_at_desc
    else
      links = current_user.links.select(:id, :title, :url, :tweet_url, :created_at).order_by_created_at_desc
    end
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
    link = current_user.links.build(link_params)

    if link.save
      # render json: link, status: :created
      response_created(:link)
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
      @link = current_user.links.find(params[:id])
    end

    def render_status_404(exception)
      render json: { errors: [exception] }, status: 404
    end

    def render_status_500(exception)
      render json: { errors: [exception] }, status: 500
    end
end
