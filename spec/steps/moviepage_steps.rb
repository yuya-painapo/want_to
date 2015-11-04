# coding: utf-8
steps_for :moviepage do
  step '動画検索画面を表示する' do
    visit '/home/index'
  end
  step ':movie_id の再生画面を表示する' do |movie_id|
    visit "/home/movie/#{movie_id}"
  end
  step ':movie_id の :n 分割再生画面を表示する' do |movie_id, n|
    visit "/home/movie/#{movie_id}/#{n}"
  end
  step '動画検索画面が表示されていること' do
    expect(current_path).to satisfy { |p| ['/home/index'].include?(p) }
  end
end
