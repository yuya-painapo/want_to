# coding: utf-8
require 'rails_helper'

step 'トップ画面を表示する' do
  visit '/'
end

step 'トップ画面が表示されていること' do
  expect(page).to have_content '見てる人がniconicoできるようなハイライトを提供します。'
end
