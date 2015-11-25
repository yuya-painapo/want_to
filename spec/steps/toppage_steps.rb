# coding: utf-8
require 'rails_helper'
steps_for :toppage do
  step '遠隔技術動画が表示されていること' do
    expect(current_path).to satisfy { |p| ['/home/movie/sm20652382', '/home/movie/sm20628576'].include?(p) }
  end
  
  step 'サインアップする' do
   user = User.new(
	   :nickname => "test_user",
	   :email => "user@example.com",
	   :password => "userpassword",
	   :password_confirmation => "userpassword")

   visit '/users/sign_up'
	 
   fill_in 'user[nickname]', with: user.nickname
   fill_in 'user[email]', with: user.email
   fill_in 'user[password]', with: user.password
   fill_in 'user[password_confirmation]', with: user.password_confirmation

   click_button 'アカウント登録'
  end

  step 'メールアドレスでログインする' do 
    user = User.new(
	    :email => "user@example.com",
        :password => "userpassword",
        :password_confirmation => "userpassword")
    user.save
   
    visit '/users/sign_in'
   
    fill_in 'user[login]', with: user.email
    fill_in 'user[password]', with: user.password
   
    click_button 'ログイン'
  end

end
