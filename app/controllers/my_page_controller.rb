class MyPageController < ApplicationController

  before_action :authenticate_user!

  def index
    @bookmarks = Bookmark.where(user_id: current_user.id)
  end
end
