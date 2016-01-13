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
    response = https.start { |h|
      h.post(path, body)
    }
    
    cookie = ''
    response['set-cookie'].split('; ').each do |st|
      idx = st.index('user_session_')
      if idx
        cookie = "user_session=#{st[idx..-1]}"
        break
      end
    end
    return cookie
  end
  
  def get_flv_info(cookie, video_id)
    if Cacheflvinfo.exists?(smid: video_id)
        flv_infos = Cacheflvinfo.where(smid: video_id).first
        #flv_info = flv_infos.flvinfo
        logger.info "### load cache flv_info "
        flv_info = {}
        flv_infos.flvinfo.split('&').each do |st|
          stt = st.split('=')
          flv_info[stt[0].to_sym] = stt[1]
        end
    else
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
      
	  unless flv_info[:thread_id].nil?
        flv = Cacheflvinfo.new(smid: video_id, flvinfo: response.body)
        flv.save
	  end
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
    @trendtag = TagRanking.instance.tag
    @bookmarks = Bookmark.order('created_at DESC').limit(10)
    logger.info @trendtag
  end
  
  def movie
    @id = params[:id]
    @id = "sm18391671" if @id.nil?
    movie_thumb_info = get_nicovideo_thumb_response(@id)

    cookie = login_nicovideo(ENV["NICOADD"], ENV["NICOPASS"])
    flv_info = get_flv_info(cookie, @id)
    
    if flv_info.key? :closed
      logger.info flv_info
      flash[:notice] = '動画情報取得時にエラーが発生しました。しばらく待ってもう一度更新してください。'
      return redirect_to :back
    end

    if flv_info[:error]
      msg = "指定された動画取得時にエラーが発生しました。動画ID = #{@id}"
      logger.info "#{msg}, flv_info = #{flv_info.inspect}"
      flash[:notice] = msg
      return redirect_to :back
    end

    if flv_info.key? :deleted
      msg = "指定された動画は削除されています。動画ID = #{@id}"
      logger.info "#{msg}, flv_info = #{flv_info.inspect}"
      flash[:notice] = msg
      return redirect_to :back
    end
        

    @bookmarks = Bookmark.where(smid: @id)

    flv_data = get_comments(flv_info, 1000) # max 1000
    chat = flv_data.select{ |data| data['chat'] }
    @comments = chat.sort{ |a, b| a['chat']['vpos'] <=> b['chat']['vpos'] }
    
    @vpos_video_length = time_to_vpos(movie_thumb_info[:thumb][:length])
   
    if ("#{@vpos_video_length}".to_i/100 < 30)
      params[:num] ||= "#{@vpos_video_length}".to_i/100
    else
      params[:num] ||= '30'
    end
 
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
    session[:q] = params[:q]
    if params[:q].empty?
      flash[:notice] = 'キーワードが入力されていません'
      return redirect_to :back
    end

    movie_url_pattern = /http:\/\/www.nicovideo.jp\/watch\/(sm[0-9]+)/
    q = (md = params[:q].match(movie_url_pattern)) ? md[1] : params[:q]
    thumb_info = get_nicovideo_thumb_response(q) if q.match(/^[a-z]|[0-9]+$/)
    if thumb_info.try(:[], :thumb) && thumb_info[:thumb].key?(:ch_id)
      flash[:notice] = "動画ID : #{q} はチャンネル動画なのでniconicoで課金して見てね！"
      return redirect_to :back
    elsif q.match(/^sm[0-9]+$/) || q.match(movie_url_pattern)
      if thumb_info[:thumb] && thumb_info[:thumb][:embeddable] == '0'
        flash[:notice] = "動画ID : #{q} はniconico公式でのみ視聴可能です！"
        return redirect_to :back
      elsif thumb_info[:error] && thumb_info[:error].value?('NOT_FOUND')
        flash[:notice] = "動画ID : #{q} は見つかりません。動画は存在しないか、削除された可能性があります"
        return redirect_to :back
      elsif thumb_info[:error] && thumb_info[:error].value?('DELETED')
        flash[:notice] = "動画ID : #{q} は削除、非公開設定、配信停止の為、視聴できません"
        return redirect_to :back
      else
        return redirect_to action: 'movie', id: q
      end
    else
      nico = NicoSearchSnapshot.new('niconico_highlight')
      results = nico.search(q, size: 40, search: [:tags_exact], sort_by: :comment_counter)

      results.shuffle!.each do |r|
        thumb = get_nicovideo_thumb_response(r.cmsid)
        if !thumb.key?(:error).present? && r.cmsid =~ /^sm/ && thumb[:thumb][:embeddable] == '1'
          logger.info r.cmsid
          return redirect_to action: 'movie', id: r.cmsid
        end
      end

      flash[:notice] = "keyword : #{q} だと再生可能な動画が表示できません"
      return redirect_to :back
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

  def create
    smid = params[:smid]
    start_vpos = params[:start_vpos]
    comment = params[:comment]
    bookmark = Bookmark.new(smid: smid, start_vpos: start_vpos, comment: comment)
    bookmark.user_id = current_user.id
    bookmark.save
    @bookmarks = [bookmark]
    respond_to do |format|
      format.js
    end
  end
end
