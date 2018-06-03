require 'rss'
require 'uri'

class GetTVInfo
  def initialize(*names)
    @names = names
  end

  def get_rss_url(name)
    name_escape = URI.escape(name)
    base_url = "http://tv.so-net.ne.jp/rss/schedulesBySearch.action?condition.keyword=#{name_escape}&stationPlatformId=0"
  end

  def get_rss(name)
    url = get_rss_url(name)
    rss = RSS::Parser.parse(url)
    data = []
    rss.items.each do|r|
      tv_data = FormatTVData.new(name)
      data << tv_data.render(r)
    end
    data
  end

  def get_all_rss()
    all_data = []
    @names.each do |n|
      all_data << get_rss(n)
    end
    all_data.flatten()
  end
end