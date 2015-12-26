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

  def follow
    follow = Follow.new(from_user_id: current_user.id, to_user_id: params[:user])
    follow.save
    respond_to do |format|
      format.js
    end
  end

  def remove
    follow = Follow.where(from_user_id: current_user.id, to_user_id: params[:user]).first
    follow.destroy
    respond_to do |format|
      format.js
    end
  end
end
