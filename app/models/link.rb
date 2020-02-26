class Link < ApplicationRecord
  validates :url, presence: true
  validate :check_url

  after_validation :set_title, :set_tweet_url

  def check_url
    if url !~ /\A^(http|https)?:\/\/([-\w]+\.)+[-\w]+(\/[-\w.\/?%&=#@]*)?$\z/
      errors.add(:url, "の内容が不正です")
    end
  end

  def self.divide_monthly(targetDate)
    return self.where(created_at: targetDate.in_time_zone.all_month).order('created_at desc')
  end

  def self.order_by_created_at_desc
    return self.order('created_at desc')
  end

  private

    def set_title
      return if self.errors[:url].present?
      mechan = Mechanize.new
      page = mechan.get(self.url)
      self.title = page.search('title').inner_text
    end

    def set_tweet_url
      self.tweet_url = URI.encode(
        "http://twitter.com/intent/tweet?original_referer=" +
        "&url=" +
        self.url +
        "&text=#reading " +
        self.title
      )
    end
end
