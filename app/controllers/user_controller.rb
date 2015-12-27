# coding: utf-8
# UserController
class UserController < ApplicationController
  def show
    begin
      @user = User.find(params[:id])
    rescue
      flash[:notice] = "ユーザーID #{params[:id]} は存在しません。"
      return redirect_to :home_index
    end
  end
end
