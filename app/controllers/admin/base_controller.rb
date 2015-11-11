class Admin::BaseController < ApplicationController
  def index
	  redirect_to home_index_path
  end
end
