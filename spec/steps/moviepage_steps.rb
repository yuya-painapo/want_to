# coding: utf-8
steps_for :moviepage do
  step ':movie_id の再生画面を表示する' do |movie_id|
    visit "/home/movie/#{movie_id}"
  end 
  step 'トップ画面が表示されていること' do
    expect(current_path).to satisfy { |p| ['/', '/home/index'].include?(p) }
  end
end
