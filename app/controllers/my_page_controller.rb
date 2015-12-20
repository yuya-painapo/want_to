# MyPageController
class MyPageController < ApplicationController
  before_action :authenticate_user!

  def index
    @bookmarks = Bookmark.where(user_id: current_user.id)
  end

  def update
    bookmark = Bookmark.where(user_id: current_user.id, id: params[:id]).first
    bookmark.start_vpos = params[:start_vpos]

    bookmark.comment = params[:comment]
    bookmark.save

    redirect_to action: 'index'
  end

  def delete
    bookmark = Bookmark.where(user_id: current_user.id, id: params[:id]).first
    if bookmark.destroy
      flash[:notice] = 'ふせんを削除しました。'
    else
      flash[:notice] = 'ふせんの削除に失敗しました。'
    end
  end
end
