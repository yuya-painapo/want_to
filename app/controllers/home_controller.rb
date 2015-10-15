class HomeController < ApplicationController
  require 'net/https'
  require 'uri'
  require 'json'

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
        flv_data = get_comments(flv_info, 1000) # max 1000
        chat = flv_data.select{ |data| data['chat'] }
        @comments = chat.sort{ |a, b| a['chat']['vpos'] <=> b['chat']['vpos'] }
  end

  def input_word
  end

  def search
	if params[:q].empty? then
		 flash[:notice] = '盛り上がってる動画が見つからないよぉ'
	 	 redirect_to action: 'index'
    elsif params[:q].match(/^sm[0-9]*$/) then
      redirect_to action: 'movie', id: params[:q]
    else
	  nico = NicoSearchSnapshot.new('niconico_highlight')
	  results = nico.search(params[:q], size: 15, search: [:tags_exact], sort_by: :comment_counter)
	  
	  if !results.empty? then
	  	smID = results[rand(results.size)].cmsid
	  	redirect_to action: 'movie', id: smID
	  else
		 flash[:notice] = '盛り上がってる動画が見つからないよぉ'
	 	 redirect_to action: 'index'
	  end
  end
  end
end
