class Api::V1::Links::YearmonthsController < ApplicationController
  def index
    links = Link.select("created_at").map{ |i|
      c = Time.zone.at(i.created_at)
      { name: c.strftime('%Y%m'), year: c.year, month: c.month }
    }.uniq
    render json: links.to_json()
  end
end
