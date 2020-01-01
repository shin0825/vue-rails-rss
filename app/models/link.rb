class Link < ApplicationRecord
  validates :url, presence: true

  after_validation :set_title

  def self.divide_monthly(targetDate)
    return self.where(created_at: targetDate.in_time_zone.all_month).order('created_at desc')
  end

  def self.order_by_created_at_desc
    return self.order('created_at desc')
  end

  private
    def set_title
      mechan = Mechanize.new
      page = mechan.get(self.url)
      self.title = page.search('title').inner_text
    end
end
