class HomeController < ApplicationController
  def index
        @id = params[:id]
        if @id == nil then
            @id = "sm18391671" #sm25019253 #ebifly #sm9704169 #bond
        end 

        cookie = login_nicovideo(ENV["NICOADD"], ENV["NICOPASS"])
        flv_info = get_flv_info(cookie, @id)
        flv_data = get_comments(flv_info, 1000) # max 1000
        chat = flv_data.select{ |data| data['chat'] }
        @comments = chat.sort{ |a, b| a['chat']['vpos'] <=> b['chat']['vpos'] }

        if params[:num] == nil then
           params[:num] = '10' 
        end

        @vpos_video_length = nicovideo_length(@id) 
        @m_division = params[:num].to_i
        @vpos_range = divide_equally(@vpos_video_length, @m_division)
        @video_time_range = from_vpos_to_time(@vpos_range,@m_division)
        @block_com_num = get_comment_number(@vpos_range, @comments, @m_division)        
        @time_watch = plus_time(@vpos_range,@m_division)
 
  end
end
