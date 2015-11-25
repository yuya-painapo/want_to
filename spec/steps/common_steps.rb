# coding: utf-8
step '動画検索画面を表示する' do
  visit '/home/index'
end

step ':name に :word と入力する' do |name, word|
  fill_in name, with: word
end

step ':name ボタンをクリックする' do |name|
  click_on name
end

step '動画検索画面が表示されていること' do
  expect(current_path).to satisfy { |p| ['/home/index'].include?(p) }
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

step '再生画面が表示されていること' do
  expect(current_path).to match "/home/movie/.*"
end

step 'ログイン画面が表示されていること' do
  expect(current_path).to eq "/users/sign_in"
end

step 'メッセージ :message が表示されていること' do |message|
  expect(page).to have_content message
end

step ':name の値が :value であること' do |name, value|
  expect(page.find(name).value).to eq value
end

step '要素 :selector の :n 番目の要素の内容に :text が含まれていること' do |selector, n, text|
  expect(page.all(:css, selector)[n.to_i].text).to match text
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

step 'リンク :selector をクリックする' do |selector|
  click_link selector
end

#step ':model_name のテストデータを作成する' do |model_name|
#  FactoryGirl.create(model_name)
#end

step 'ログインする' do 
  user = User.new(
      :nickname => "test_user",
      :password => "userpassword",
      :password_confirmation => "userpassword")
  user.save
 
  visit '/users/sign_in'
 
  fill_in 'user[login]', with: user.nickname
  fill_in 'user[password]', with: user.password
 
  click_button 'ログイン'
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

step ':name と :password でログインする' do |name, password|
   visit '/users/sign_in'

   fill_in 'user[login]', with: name
   fill_in 'user[password]', with: password

   click_button 'ログイン'
end

step 'ユーザー :user_id のユーザーページを表示する' do |user_id|
  visit "/user/#{user_id}"
end

step 'ユーザー :user_id のユーザーページが表示されていること' do |user_id|
  expect(current_path).to eq "/user/#{user_id}"
end
