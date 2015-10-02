class HomeController < ApplicationController
	def index
        @id = params[:id]
        if @id == nil then
            @id = "sm18391671" #sm25019253 #ebifly #sm9704169 #bond
        end 

        cookie = login_nicovideo(NICOADD, NICOPASS)
        flv_info = get_flv_info(cookie, @id)
        @comments = get_comments(flv_info, 10) # max 1000

	end
end
