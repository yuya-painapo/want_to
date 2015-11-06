# coding: utf-8
require 'rails_helper'
steps_for :toppage do
  step '動画検索画面を表示する' do
    visit '/home/index'
  end

  step '動画検索画面が表示されていること' do
    expect(current_path).to satisfy { |p| ['/home/index'].include?(p) }
  end

  step ':name に :word と入力する' do |name, word|
    fill_in name, with: word
  end

  step ':name ボタンをクリックする' do |name|
    click_on name
  end

  step ':movie_id の再生画面を表示する' do |movie_id|
    visit "/home/movie/#{movie_id}"
  end

  step ':movie_id の再生画面が表示されていること' do |movie_id|
    expect(current_path).to eq "/home/movie/#{movie_id}"
  end

  step 'メッセージ :message が表示されていること' do |message|
    expect(page).to have_content message
  end

  step ':name の値が :value であること' do |name, value|
    expect(page.find(name).value).to eq value
  end

  step 'ログインする' do 
   user = User.new(
                     :email => "test@test.com",
                     :password => "test1234",
                     :password_confirmation => "test1234"
                     )
   user.save
   #Capybara.app_host = "http://localhost:3000"

   visit '/users/sign_in'

   fill_in 'user[email]',    with: user.email
   fill_in 'user[password]', with: user.password

   click_button 'Sign in'
   expect(page).to have_content 'Signed in successfully.'
  end
  
  step 'サインインする' do
   user = User.new(
                     :email => "signup@test.com",
                     :password => "signup1234",
                     :password_confirmation => "signup1234"
                     )
   user.save

   visit '/users/sign_up'
	 
   fill_in 'user[email]',    with: user.email
   fill_in 'user[password]', with: user.password
   fill_in 'user[password_confirmation]', with: user.password_confirmation

   click_button 'Sign up'
   expect(page).to have_content 'Signed in successfully.'
  end
end
