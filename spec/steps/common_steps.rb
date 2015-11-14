# coding: utf-8
step ':name に :word と入力する' do |name, word|
  fill_in name, with: word
end

step ':name ボタンをクリックする' do |name|
  click_on name
end

step '動画検索画面が表示されていること' do
  expect(current_path).to satisfy { |p| ['/home/index'].include?(p) }
end

step '遠隔技術動画が表示されていること' do
  expect(current_path).to satisfy { |p| ['/home/movie/sm20652382', '/home/movie/sm20628576'].include?(p) }
end

step '遠隔技術動画が表示されていること' do
  expect(current_path).to satisfy { |p| ['/home/movie/sm20652382', '/home/movie/sm20628576'].include?(p) }
end

step ':movie_id の再生画面が表示されていること' do |movie_id|
  expect(current_path).to eq "/home/movie/#{movie_id}"
end

step ':movie_id の :n 分割再生画面が表示されていること' do |movie_id, n|
  expect(current_path).to eq "/home/movie/#{movie_id}/#{n}"
end

step ':movie_id 以外のの再生画面が表示されていること' do |movie_id|
  expect(current_path).not_to eq "/home/movie/#{movie_id}"
end

step 'メッセージ :message が表示されていること' do |message|
  expect(page).to have_content message
end

step ':name の値が :value であること' do |name, value|
  expect(page.find(name).value).to eq value
end

step '要素 :selector が存在すること' do |selector|
  expect(page.has_css?(selector, visible: :all)).to eq true
end

step '要素 :selector が存在しないこと' do |selector|
  expect(page.has_css?(selector, visible: :all)).to eq false
end

step '要素 :selector が :n 個存在すること' do |selector, n|
  expect(page.has_css?(selector, count: n, visible: :all)).to eq true
end

step ':factory_name のテストデータを作成する' do |factory_name|
  FactoryGirl.create(factory_name)
end

step ':file_name にスクリーンショットをとる' do |file_name|
    page.save_screenshot(file_name, full: true)
end

step 'マイページを表示する' do
  visit '/my_page/index'
end

step 'マイページが表示されていること' do
  expect(current_path).to eq '/my_page/index'
end

step ':email と :password でログインする' do |email, password|
   visit '/users/sign_in'

   fill_in 'user[email]',    with: email
   fill_in 'user[password]', with: password

   click_button 'ログイン'
end
