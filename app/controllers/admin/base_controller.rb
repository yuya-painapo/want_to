class Admin::BaseController < ApplicationController
  before_action :authenticate_user!
  def index
	  redirect_to home_index_path
  end
end
