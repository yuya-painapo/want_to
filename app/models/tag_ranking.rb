require 'singleton'

# keep tagrank class
class TagRanking
  include Singleton

  def initialize
    @tag = nico_trend_tag
    @time = Time.zone.now
  end

  def tag
    now = Time.zone.now
    if (now - @time) / 60 > 15
      @time = Time.zone.now
      @tag = nico_trend_tag
    else
      @tag
    end
  end

  private

  def nico_trend_tag
    url = 'http://www.nicovideo.jp/trendtag?ref=top_trendtagpage'

    charset = nil
    html = open(url) do |f|
      charset = f.charset
      f.read
    end

    parse_trend_html(html, charset)
  end

  def parse_trend_html(html, charset)
    doc = Nokogiri::HTML.parse(html, nil, charset)
    tag_rank = {}

    doc.css('div#tagRanking/div.box/h2').each do |node|
      rank = node.css('span').inner_text.to_i
      tag = node.css('a').inner_text
      tag_rank.store(rank, tag)
    end

    tag_rank
  end
end
