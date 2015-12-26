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
    tag_rank = Hash.new

    doc.css('div#tagRanking/div.box').each do |node|
	  tag_info = Hash.new
      rank = node.css('h2/span').inner_text.to_i
	  #caption.push(node.css('h2/a').inner_text)
	  #caption.push(node.css('div.commentBox/p.txt').inner_html)
      #tag_rank.store(rank, caption)
	  tag_info.store("tag_name",node.css('h2/a').inner_text)
	  tag_info.store("caption",node.css('div.commentBox/p.txt').inner_html)
	  tag_rank.store(rank, tag_info)
    end

    tag_rank
  end
end
