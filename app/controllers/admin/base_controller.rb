class Admin::BaseController < ApplicationController
  before_filter :authenticate_user!
  def index
	  redirect_to home_index_path
  end
end
