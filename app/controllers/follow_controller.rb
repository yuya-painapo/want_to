# FollowController
class FollowController < ApplicationController
  before_action :authenticate_user!

  def create
    follow = Follow.new(from_user_id: current_user.id, to_user_id: params[:user])
    follow.save
    respond_to do |format|
      format.js
    end
  end

  def delete
    follow = Follow.where(from_user_id: current_user.id, to_user_id: params[:user]).first
    follow.destroy
    respond_to do |format|
      format.js
    end
  end
end
