class WelcomeController < ApplicationController
  def index
    if user_signed_in?
      redirect_to controller: 'home', action: 'index'
    end
  end
end
