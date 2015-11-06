# -*- coding: utf-8 -*-
class HomeController < ApplicationController
  require 'net/https'
  require 'uri'
  require 'json'
  require 'active_support'
  require 'active_support/core_ext'
  
  def login_nicovideo(mail, pass)
    host = 'secure.nicovideo.jp'
    path = '/secure/login?site=niconico'
    body = "mail=#{mail}&password=#{pass}"
    
    https = Net::HTTP.new(host, 443)
    https.use_ssl = true
    https.verify_mode = OpenSSL::SSL::VERIFY_NONE
    response = https.start { |https|
      https.post(path, body)
    }
    
    cookie = ''
    response['set-cookie'].split('; ').each do |st|
      if idx = st.index('user_session_')
        cookie = "user_session=#{st[idx..-1]}"
        break
      end
    end
    return cookie
  end
  
  def get_flv_info(cookie, video_id)
    host = 'flapi.nicovideo.jp'
    path = "/api/getflv/#{video_id}"
    
    response = Net::HTTP.new(host).start { |http|
      request = Net::HTTP::Get.new(path)
      request['cookie'] = cookie
      http.request(request)
    }
    
    flv_info = {}
    response.body.split('&').each do |st|
      stt = st.split('=')
      flv_info[stt[0].to_sym] = stt[1]
    end
    
    return flv_info
  end
  
  def get_comments(flv_info, res_from)
    host = URI.unescape(flv_info[:ms])
    request = "#{host.gsub(/\/api\//, '/api.json/')}thread?thread=#{flv_info[:thread_id]}&version=20061206&res_from=-#{res_from}"
    
    uri = URI.parse(request)
    json = Net::HTTP.get(uri)
    comments = JSON.parse(json)
  
    return comments
  end

  def index
    @q = session[:q]
    @trendtag = get_nico_trend_tag
    logger.info @trendtag
  end
  
  def movie
    @id = params[:id]
    @id = "sm18391671" if @id.nil?
    movie_thumb_info = get_nicovideo_thumb_response(@id)

    cookie = login_nicovideo(ENV["NICOADD"], ENV["NICOPASS"])
    flv_info = get_flv_info(cookie, @id)
    
    if flv_info[:error]
      msg = "指定された動画取得時にエラーが発生しました。動画ID = #{@id}"
      logger.info "#{msg}, flv_info = #{flv_info.inspect}"
      flash[:notice] = msg
      redirect_to :back
      return
    end

    if flv_info.has_key? :deleted
      msg = "指定された動画は削除されています。動画ID = #{@id}"
      logger.info msg + ", flv_info = " + flv_info.inspect
      flash[:notice] = msg
      redirect_to :back
      return
    end
        
    flv_data = get_comments(flv_info, 1000) # max 1000
    chat = flv_data.select{ |data| data['chat'] }
    @comments = chat.sort{ |a, b| a['chat']['vpos'] <=> b['chat']['vpos'] }
    params[:num] ||= '10'
    @vpos_video_length = time_to_vpos(movie_thumb_info[:thumb][:length])
    @m_division = params[:num].to_i
    @vpos_range = divide_equally(@vpos_video_length, @m_division)
    @start_time, @finish_time = from_vpos_to_time(@vpos_range,@m_division)
    @block_com_num = get_comment_number(@vpos_range, @comments, @m_division)
    @time_watch = plus_time(@vpos_range)
    @threshold = get_threshold(@block_com_num)
    @highlights_place = get_highlight_place(@threshold,@block_com_num,@start_time,@finish_time)
    @video_title = movie_thumb_info[:thumb][:title]

    @q = session[:q]
  end
  
  def search
    # セッションに検索キーワードを格納
    session[:q] = params[:q]
    if params[:q].empty?
      flash[:notice] = 'キーワードが入力されていません'
      redirect_to :back
      return
    end

    thumb_info = get_nicovideo_thumb_response(params[:q]) if params[:q].match(/^[a-z]|[0-9]+$/)
    if thumb_info.try(:[], :thumb) && thumb_info[:thumb].has_key?(:ch_id)
      flash[:notice] = "動画ID : #{params[:q]} はチャンネル動画なのでniconicoで課金して見てね！"
      redirect_to :back
      return
    elsif params[:q].match(/^sm[0-9]+$/)
      if thumb_info[:thumb] && thumb_info[:thumb][:embeddable] == "0"
        flash[:notice] = "動画ID : #{params[:q]} はniconico公式でのみ視聴可能です！"
        redirect_to :back
        return
      elsif thumb_info[:error] && thumb_info[:error].has_value?("NOT_FOUND")
        flash[:notice] = "動画ID : #{params[:q]} は見つかりません。動画は存在しないか、削除された可能性があります"
        redirect_to :back
        return
      elsif thumb_info[:error] && thumb_info[:error].has_value?("DELETED")
        flash[:notice] = "動画ID : #{params[:q]} は削除、非公開設定、配信停止の為、視聴できません"
        redirect_to :back
        return
      else
        redirect_to action: 'movie', id: params[:q]
        return
      end
    else
      nico = NicoSearchSnapshot.new('niconico_highlight')
      results = nico.search(params[:q], size: 30, search: [:tags_exact], sort_by: :comment_counter)

      sm_list = []
      results.each do |r| 
        thumb = get_nicovideo_thumb_response(r.cmsid)
        if !thumb.has_key?(:error).present? && r.cmsid =~ /^sm/ && thumb[:thumb][:embeddable] == "1" 
          sm_list << r.cmsid
        end 
      end 
      
      unless sm_list.empty?
        smID = sm_list[rand(sm_list.size)]
        logger.info smID
        redirect_to action: 'movie', id: smID
        return
      else
        flash[:notice] = "keyword : #{params[:q]} だと再生可能な動画が表示できません"
        redirect_to :back
      end
    end
  end

  def get_nicovideo_thumb_response(id_info)
    request = "http://ext.nicovideo.jp/api/getthumbinfo/#{id_info}"

    uri = URI.parse(request)
    xml = Net::HTTP.get(uri)
    json = Hash.from_xml(xml).to_json
    nico_thumb_info = JSON.parse(json,{:symbolize_names => true})

    return nico_thumb_info[:nicovideo_thumb_response]
  end
  
  def get_nico_trend_tag
    url = 'http://www.nicovideo.jp/trendtag?ref=top_trendtagpage'
    
    charset = nil 
    html = open(url) do |f| 
      charset = f.charset
      f.read
    end
    
    doc = Nokogiri::HTML.parse(html, nil, charset)
    tagRank = Hash.new

	doc.css('div#tagRanking/div.box/h2').each do |node|
        rank = node.css('span').inner_text.to_i
        tag = node.css('a').inner_text
        tagRank.store(rank, tag)
    end
    
    return tagRank
  end

  def create
    smid = params[:smid]
    start_vpos = params[:start_vpos]
    bookmark = Bookmark.new(smid: smid, start_vpos: start_vpos)
    bookmark.user_id = current_user.id
    bookmark.save
    @bookmarks = [bookmark]
    respond_to do |format|
      format.js
    end
  end
end
