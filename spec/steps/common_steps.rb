# coding: utf-8
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

step ':name の値が :value であること' do |name, value|
  expect(page.find(name).value).to eq value
end

step '要素 :selector が存在すること' do |selector|
  expect(page.has_css?(selector, visible: :all)).to eq true
end
