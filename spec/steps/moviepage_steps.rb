# coding: utf-8
module MoviepageSteps
  step ':movie_id の再生画面を表示する' do |movie_id|
    visit "/home/movie/#{movie_id}"
  end
end

RSpec.configure do |config|
  config.include MoviepageSteps, moviepage: true
end
