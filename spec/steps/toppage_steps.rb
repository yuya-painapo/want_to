# coding: utf-8
require 'rails_helper'
steps_for :toppage do
  step '遠隔技術動画が表示されていること' do
    expect(current_path).to satisfy { |p| ['/home/movie/sm20652382', '/home/movie/sm20628576'].include?(p) }
  end
  
  step 'サインアップする' do
   user = User.new(
	   :email => "hogehuga@test.com",
	   :password => "hogehuga1234",
	   :password_confirmation => "hogehuga1234")

   visit '/users/sign_up'
	 
   fill_in 'user[email]',    with: user.email
   fill_in 'user[password]', with: user.password
   fill_in 'user[password_confirmation]', with: user.password_confirmation

   click_button 'アカウント登録'
  end

end
