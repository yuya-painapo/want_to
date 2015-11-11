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

  step 'ログインする' do 
   user = User.new(
	   :email => "hoge@test.com",
	   :password => "hoge1234",
	   :password_confirmation => "hoge1234")
   user.save

   visit '/users/sign_in'

   fill_in 'user[email]',    with: user.email
   fill_in 'user[password]', with: user.password

   click_button 'ログイン'
  end

  step ':model_name のテストデータを作成する' do |model_name|
    FactoryGirl.create(model_name)
  end
end
