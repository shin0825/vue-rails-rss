class Link < ApplicationRecord
  validates :url, presence: true

  after_validation :set_title

  private
    def set_title
      mechan = Mechanize.new
      page = mechan.get(self.url)
      self.title = page.search('title').inner_text
    end
end
