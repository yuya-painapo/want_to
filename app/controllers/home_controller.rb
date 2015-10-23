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
    request = "#{host.gsub(/\/api\//, '/api.json/')}thread?thread=#{flv_info[:thread_id]}&version=20061206&res_from=-#{res_from.to_s}"
    
    uri = URI.parse(request)
    json = Net::HTTP.get(uri)
    comments = JSON.parse(json)
  
    return comments
  end

  def index
  end
  
  def movie
    @id = params[:id]
    @id = "sm18391671" if @id.nil?

    cookie = login_nicovideo(ENV["NICOADD"], ENV["NICOPASS"])
    flv_info = get_flv_info(cookie, @id)
    
    if flv_info[:error]
      msg = "指定された動画取得時にエラーが発生しました。動画ID = #{@id}"
      logger.info "#{msg}, flv_info = #{flv_info.inspect}"
      flash[:notice] = msg
      render action: 'index'
      return
    end
    
    flv_data = get_comments(flv_info, 1000) # max 1000
    chat = flv_data.select{ |data| data['chat'] }
    @comments = chat.sort{ |a, b| a['chat']['vpos'] <=> b['chat']['vpos'] }
    params[:num] ||= '10'
    @vpos_video_length = nicovideo_length(@id) 
    @m_division = params[:num].to_i
    @vpos_range = divide_equally(@vpos_video_length, @m_division)
    @video_time_range = from_vpos_to_time(@vpos_range,@m_division)
    @block_com_num = get_comment_number(@vpos_range, @comments, @m_division)        
    @time_watch = plus_time(@vpos_range)
  end
  
  def search
	check_q = foo_check(params[:q]) if params[:q].match(/^[a-z]|[0-9]+$/)
    if params[:q].empty?
      flash[:notice] = 'キーワードが入力されていません'
      redirect_to action: 'index'
	elsif !check_q.nil? && check_q[:thumb] && check_q[:thumb].has_key?(:ch_id)
      flash[:notice] = "動画ID : #{params[:q]} はチャンネル動画なのでniconicoで課金して見てね！"
      redirect_to action: 'index'
    elsif params[:q].match(/^sm[0-9]+$/)
	  if check_q[:thumb] && check_q[:thumb][:embeddable] == "0"
        flash[:notice] = "動画ID : #{params[:q]} はniconico公式でのみ視聴可能です！"
        redirect_to action: 'index'
	  elsif check_q[:error] && check_q[:error].has_value?("NOT_FOUND")
        flash[:notice] = "動画ID : #{params[:q]} は見つかりません。動画は存在しないか、削除された可能性があります"
        redirect_to action: 'index'
	  elsif check_q[:error] && check_q[:error].has_value?("DELETED")
        flash[:notice] = "動画ID : #{params[:q]} は削除、非公開設定、配信停止の為、視聴できません"
        redirect_to action: 'index'
	  else
        redirect_to action: 'movie', id: params[:q]
	  end
	else

      nico = NicoSearchSnapshot.new('niconico_highlight')
      results = nico.search(params[:q], size: 15, search: [:tags_exact], sort_by: :comment_counter)

      sm_list = []
      results.each do |r| 
        thumb = foo_check(r.cmsid)
        if !thumb.has_key?(:error) && r.cmsid =~ /^sm/ && thumb[:thumb][:embeddable] == "1" 
            sm_list << r.cmsid
        end 
      end 
      
      unless results.empty?
        smID = sm_list[rand(sm_list.size)]
        redirect_to action: 'movie', id: smID
      else
        flash[:notice] = "keyword : #{params[:q]} だと動画が見つからないよ！"
        redirect_to action: 'index'
      end
    end
  end

  def foo_check(check)
	request = "http://ext.nicovideo.jp/api/getthumbinfo/#{check}"

    uri = URI.parse(request)
    xml = Net::HTTP.get(uri)
    json = Hash.from_xml(xml).to_json
    checked = JSON.parse(json,{:symbolize_names => true})

    return checked[:nicovideo_thumb_response]
  end
end
