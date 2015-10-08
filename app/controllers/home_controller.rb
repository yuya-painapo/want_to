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
	end
end
