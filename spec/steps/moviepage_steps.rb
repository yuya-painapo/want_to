# coding: utf-8
step ':movie_id の再生画面を表示する' do |movie_id|
  visit "/home/movie/#{movie_id}"
end

step '要素 :selector が存在すること' do |selector|
  page.has_xpath?(selector)
end
