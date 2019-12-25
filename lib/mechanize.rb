class Mechanize
  url = "http://hatenablog.com/"

  agent = Mechanize.new
  page = agent.get(url)
end
