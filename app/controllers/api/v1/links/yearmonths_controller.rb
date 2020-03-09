class Api::V1::Links::YearmonthsController < ApplicationController
  def index
    links = Link.select("created_at").order("created_at desc").map{ |i|
      c = Time.zone.at(i.created_at)
      { name: c.strftime('%Y%m'), year: c.year, month: c.month }
    }.uniq
    render json: links.to_json()
  end
end
