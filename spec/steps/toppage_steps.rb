# coding: utf-8
require 'rails_helper'

step 'トップ画面を表示する' do
  visit '/'
end

step 'トップ画面が表示されていること' do
  expect(current_path).to satisfy { |p| ['/', '/home/index'].include?(p) }
end

step ':name に :word と入力する' do |name, word|
  fill_in name, with: word
end

step ':name ボタンをクリックする' do |name|
  click_on name
end

step ':movie_id の再生画面が表示されていること' do |movie_id|
  expect(current_path).to eq "/home/movie/#{movie_id}"
end

step 'メッセージ :message が表示されていること' do |message|
  expect(page).to have_content message
end
