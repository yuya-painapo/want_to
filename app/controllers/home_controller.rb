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
    request = host.gsub(/\/api\//, '/api.json/') + 'thread?thread=' + flv_info[:thread_id] + '&version=20061206&res_from=-' + res_from.to_s
    
    uri = URI.parse(request)
    json = Net::HTTP.get(uri)
    comments = JSON.parse(json)
  
    return comments
  end

  def index
  end
  
  def movie
    @id = params[:id]
    if @id == nil then
      @id = "sm18391671" #sm25019253 #ebifly #sm9704169 #bond
    end 
    
    cookie = login_nicovideo(ENV["NICOADD"], ENV["NICOPASS"])
    flv_info = get_flv_info(cookie, @id)
    
    if flv_info[:error]
      msg = '指定された動画取得時にエラーが発生しました。動画ID = ' + @id
      logger.info msg + ", flv_info = " + flv_info.inspect
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
    if params[:q].empty? then
      flash[:notice] = 'キーワードが入力されていません'
      render action: 'index'
    elsif params[:q].match(/^sm[0-9]+$/) then
      redirect_to action: 'movie', id: params[:q]
    else
      nico = NicoSearchSnapshot.new('niconico_highlight')
      results = nico.search(params[:q], size: 15, search: [:tags_exact], sort_by: :comment_counter)

      sm_list = []
      results.each do |r| 
          if r.cmsid =~ /^sm/
              sm_list << r
          end 
      end
      
      if !results.empty? then
        smID = sm_list[rand(sm_list.size)].cmsid
		counter = 0
		while foo_check(smID) == 'fail' do
          smID = sm_list[rand(sm_list.size)].cmsid
		  counter += 1
            if counter == 20 then
                msg = "keyword : #{params[:q]} だと削除されている動画しか見つからないよ！"
                logger.info msg + "削除されている動画にしかヒットしない"
                flash[:notice] = msg
                render action: 'index'
				return
            end 
		end
        redirect_to action: 'movie', id: smID
      else
        flash[:notice] = "keyword : #{params[:q]} だと動画が見つからないよ！"
        render action: 'index'
      end
    end
  end

  def foo_check(check)
	request = "http://ext.nicovideo.jp/api/getthumbinfo/#{check}"

    uri = URI.parse(request)
    xml = Net::HTTP.get(uri)
    json = Hash.from_xml(xml).to_json
    check_Foo = JSON.parse(json,{:symbolize_names => true})

    return check_Foo[:nicovideo_thumb_response][:status]
  end
end
