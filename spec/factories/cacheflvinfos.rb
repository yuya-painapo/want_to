# coding: utf-8
require 'factory_girl'

FactoryGirl.define do
  factory :sm9, class: Cacheflvinfo do
    smid "sm9"
    flvinfo "thread_id=1173108780&l=319&url=http%3A%2F%2Fsmile-com42.nicovideo.jp%2Fsmile%3Fm%3D9.0468low&ms=http%3A%2F%2Fmsg.nicovideo.jp%2F10%2Fapi%2F&ms_sub=http%3A%2F%2Fsub.msg.nicovideo.jp%2F10%2Fapi%2F&user_id=20099307&is_premium=0&nickname=lessi&time=1449831260940&done=true&ng_rv=5&hms=hiroba.nicovideo.jp&hmsp=2565&hmst=410&hmstk=1449831320.bJgyXj8Ir4ZKcy4cSXbzTKwWVVY&userkey=1449833060.%7E1%7EaesD07FEeOAME76F5hPWfnYXi5mUGTokcJtr5DH5uGc"
  end

  factory :sm32, class: Cacheflvinfo do
	  smid "sm32"
	  flvinfo "error=invalid_v1&done=true\n"
  end

  factory :so23698047, class: Cacheflvinfo do
	  smid "so23698047"
	  flvinfo "error=invalid_v1&done=true\n"
  end

  factory :"1381804974", class: Cacheflvinfo do
	  smid "1381804974"
	  flvinfo "thread_id=1381804974&l=1441&url=http%3A%2F%2Fsmile-cln62.nicovideo.jp%2Fsmile%3Fm%3D22048157.34040low&ms=http%3A%2F%2Fmsg.nicovideo.jp%2F3%2Fapi%2F&ms_sub=http%3A%2F%2Fsub.msg.nicovideo.jp%2F3%2Fapi%2F&user_id=20099307&is_premium=0&nickname=lessi&time=1449831357703&done=true&needs_key=1&optional_thread_id=1381804973&ng_rv=5&ng_ch=%252F%252Afeir.tk%3D%26%252F%252A%255BwW%25EF%25BD%2597%25EF%25BC%25B7%255D%255B.%252C%25E3%2580%2581%25E3%2580%2582%252F%25E3%2583%25BB%255C%25EF%25BF%25A5%253B%25EF%25BC%259B%253A%25EF%25BC%259A%255D%3D%26%252F%252A%255BfF%25EF%25BD%2586%25EF%25BC%25A6%255D%255BeE%25EF%25BD%2585%25EF%25BC%25A5%255D%255BiI%25EF%25BD%2589%25EF%25BC%25A9%255D%3D%26%252F%252A%255BhH%25EF%25BD%2588%25EF%25BC%25A8%255D%255BtT%25EF%25BD%2594%25EF%25BC%25B4%255D%255BtT%25EF%25BD%2594%25EF%25BC%25B4%255D%255BpP%25EF%25BD%2590%25EF%25BC%25B0%255D%255B%253A%25EF%25BC%259A%255D%3D%26%252F%252A%255BfF%25EF%25BD%2586%25EF%25BC%25A6%255D%255B%2520%25E3%2580%2580%255D%252B%255BeE%25EF%25BD%2585%25EF%25BC%25A5%255D%3D%26%252F%252A%255BeE%25EF%25BD%2585%25EF%25BC%25A5%255D%255B%2520%25E3%2580%2580%255D%252B%255BiI%25EF%25BD%2589%25EF%25BC%25A9%255D%3D%26%252F%252A%255BwW%25EF%25BD%2597%25EF%25BC%25B7%255D%255B%2520%25E3%2580%2580%255D%252B%255B.%252C%25E3%2580%2581%25E3%2580%2582%252F%25E3%2583%25BB%255C%25EF%25BF%25A5%253B%25EF%25BC%259B%253A%25EF%25BC%259A%255D%3D%26%252F%252A%255B.%252C%25E3%2580%2581%25E3%2580%2582%252F%25E3%2583%25BB%255C%25EF%25BF%25A5%253B%25EF%25BC%259B%253A%25EF%25BC%259A%255D%255BtT%25EF%25BD%2594%25EF%25BC%25B4cC%25EF%25BD%2583%25EF%25BC%25A3jJ%25EF%25BD%258A%25EF%25BC%25AAuU%25EF%25BD%2595%25EF%25BC%25B5iI%25EF%25BD%2589%25EF%25BC%25A9uU%25EF%25BD%2595%25EF%25BC%25B5nN%25EF%25BD%258E%25EF%25BC%25AEbB%25EF%25BD%2582%25EF%25BC%25A2%255D%3D%26%252F%252A%255B.%252C%25E3%2580%2581%25E3%2580%2582%252F%25E3%2583%25BB%255C%25EF%25BF%25A5%253B%25EF%25BC%259B%253A%25EF%25BC%259A%255D%255B%2520%25E3%2580%2580%255D%252B%255BtT%25EF%25BD%2594%25EF%25BC%25B4cC%25EF%25BD%2583%25EF%25BC%25A3jJ%25EF%25BD%258A%25EF%25BC%25AAuU%25EF%25BD%2595%25EF%25BC%25B5iI%25EF%25BD%2589%25EF%25BC%25A9uU%25EF%25BD%2595%25EF%25BC%25B5nN%25EF%25BD%258E%25EF%25BC%25AEbB%25EF%25BD%2582%25EF%25BC%25A2%255D%3D%26%252F%252A.%252A%255BwW%25EF%25BD%2597%25EF%25BC%25B7%255D.%252A%255BwW%25EF%25BD%2597%25EF%25BC%25B7%255D.%252A%255BwW%25EF%25BD%2597%25EF%25BC%25B7%255D.%252A%255BtT%25EF%25BD%2594%25EF%25BC%25B4%25CE%25A4%25CF%2584%255D.%252A%255BkK%25EF%25BD%258B%25EF%25BC%25AB%25CE%259A%25CE%25BA%255D.%252A%3D%26%252F%252A.%252A%255BaA%25EF%25BD%2581%25EF%25BC%25A1eE%25EF%25BD%2585%25EF%25BC%25A5%255D.%252A%255BtT%25EF%25BD%2594%25EF%25BC%25B4%255D.%252A%255BkK%25EF%25BD%258B%25EF%25BC%25AB%255D.%252A%3D%26%252F%252A%255BeE%25EF%25BD%2585%25EF%25BC%25A5%255D%255BrR%25EF%25BD%2592%25EF%25BC%25B2%255D%255BqQ%25EF%25BD%2591%25EF%25BC%25B1%255D%3D%26%252F%252A%255BeE%25EF%25BD%2585%25EF%25BC%25A5%255D%255B%2520%25E3%2580%2580%255D%252B%255BrR%25EF%25BD%2592%25EF%25BC%25B2%255D%3D%26%252F%252A%255BrR%25EF%25BD%2592%25EF%25BC%25B2%255D%255B%2520%25E3%2580%2580%255D%252B%255BqQ%25EF%25BD%2591%25EF%25BC%25B1%255D%3D%26%252F%252A.%252A%255BwW%25EF%25BD%2597%25EF%25BC%25B7%255D.%252A%255BwW%25EF%25BD%2597%25EF%25BC%25B7%255D.%252A%255BwW%25EF%25BD%2597%25EF%25BC%25B7%255D.%252A%255BtT%25EF%25BD%2594%25EF%25BC%25B4cC%25EF%25BD%2583%25EF%25BC%25A3jJ%25EF%25BD%258A%25EF%25BC%25AAuU%25EF%25BD%2595%25EF%25BC%25B5iI%25EF%25BD%2589%25EF%25BC%25A9uU%25EF%25BD%2595%25EF%25BC%25B5nN%25EF%25BD%258E%25EF%25BC%25AEbB%25EF%25BD%2582%25EF%25BC%25A2%255D.%252A%3D%26%252F%252A.%252A%255BbB%25EF%25BD%2582%25EF%25BC%25A2%255D.%252A%255BiI%25EF%25BD%2589%25EF%25BC%25A9%255D.%252A%255BtT%25EF%25BD%2594%25EF%25BC%25B4%25CE%25A4%25CF%2584%255D.%252A%255BlL%25EF%25BD%258C%25EF%25BC%25AC%255D.%252A%255ByY%25EF%25BD%2599%25EF%25BC%25B9%255D.%252A%3D%26%252F%252A.%252A%255BpP%25EF%25BD%2590%25EF%25BC%25B0%255D.%252A%255BoO%25EF%25BD%258F%25EF%25BC%25AF%255D.%252A%255BoO%25EF%25BD%258F%25EF%25BC%25AF%255D.%252A%255BtT%25EF%25BD%2594%25EF%25BC%25B4%25CE%25A4%25CF%2584%255D.%252A%3D%26%252F%252A.%252A%255BpP%25EF%25BD%2590%25EF%25BC%25B0%255D.%252A%255BoO%25EF%25BD%258F%25EF%25BC%25AF%255D.%252A%255BoO%25EF%25BD%258F%25EF%25BC%25AF%255D.%252A%255BsS%25EF%25BD%2593%25EF%25BC%25B3%255D.%252A%3D&hms=hiroba.nicovideo.jp&hmsp=2598&hmst=740&hmstk=1449831417.dLIyD_EKdSR2j4n_gkivz--rw_w&userkey=1449833157.%7E1%7E8SIggcQYHOQQle1fDBa2hLMw75htOLx9X9YPsHrTkP4"
  end

  factory :sm17524387, class: Cacheflvinfo do
	  smid "sm17524387"
	  flvinfo "thread_id=1334161854&l=708&url=http%3A%2F%2Fsmile-cln21.nicovideo.jp%2Fsmile%3Fm%3D17524387.26128low&ms=http%3A%2F%2Fmsg.nicovideo.jp%2F38%2Fapi%2F&ms_sub=http%3A%2F%2Fsub.msg.nicovideo.jp%2F38%2Fapi%2F&user_id=20099307&is_premium=0&nickname=lessi&time=1449831357926&done=true&ng_rv=5&hms=hiroba.nicovideo.jp&hmsp=2593&hmst=690&hmstk=1449831417.iwcfNQH84Y1nJRAjw3VkjIlD6k0&userkey=1449833157.%7E1%7E8SIggcQYHOQQle1fDBa2hLMw75htOLx9X9YPsHrTkP4"
  end

  factory :za3028319, class: Cacheflvinfo do
	  smid "za3028319"
	  flvinfo "thread_id=1208524072&l=834&url=http%3A%2F%2Fsmile-cln39.nicovideo.jp%2Fsmile%3Fm%3D27404936.42255&ms=http%3A%2F%2Fmsg.nicovideo.jp%2F36%2Fapi%2F&ms_sub=http%3A%2F%2Fsub.msg.nicovideo.jp%2F36%2Fapi%2F&user_id=20099307&is_premium=0&nickname=lessi&time=1449831358245&done=true&ng_rv=5&hms=hiroba.nicovideo.jp&hmsp=2559&hmst=350&hmstk=1449831418.sHq6Bn3SZZ_XoHCO9PMA-JNp8qo&userkey=1449833158.%7E1%7ERIx3vUXKgWPgyBFrF78UBl4z1Fo92dFU1jHSNjCxZkw"
  end

  factory :sm20652382, class: Cacheflvinfo do
	  smid "sm20652382"
	  flvinfo "thread_id=1366445276&l=598&url=http%3A%2F%2Fsmile-cln53.nicovideo.jp%2Fsmile%3Fm%3D20652382.51419&ms=http%3A%2F%2Fmsg.nicovideo.jp%2F38%2Fapi%2F&ms_sub=http%3A%2F%2Fsub.msg.nicovideo.jp%2F38%2Fapi%2F&user_id=20099307&is_premium=0&nickname=lessi&time=1449831257297&done=true&ng_rv=5&hms=hiroba.nicovideo.jp&hmsp=2546&hmst=220&hmstk=1449831317.P0LqaquLiDMkDh79VbNPHbvZXLM&userkey=1449833057.%7E1%7EWrrWP0UffUhCmy21Wx6QA6BOjds8TCrmKrHdb_L5nO0"
  end

  factory :sm20628576, class: Cacheflvinfo do
	  smid "sm20628576"
	  flvinfo "thread_id=1366174930&l=599&url=http%3A%2F%2Fsmile-cln16.nicovideo.jp%2Fsmile%3Fm%3D20628576.85368&ms=http%3A%2F%2Fmsg.nicovideo.jp%2F37%2Fapi%2F&ms_sub=http%3A%2F%2Fsub.msg.nicovideo.jp%2F37%2Fapi%2F&user_id=20099307&is_premium=0&nickname=lessi&time=1449831466443&done=true&ng_rv=5&hms=hiroba.nicovideo.jp&hmsp=2579&hmst=550&hmstk=1449831526.yt_QlOFCVdLCEzjTxsdviaPy3uc&userkey=1449833266.%7E1%7E3VTNscMnWudg2DAG-9p0hdhfBFOJzrT2CwN7Tdi-iEY"
  end

  factory :sm3402368, class: Cacheflvinfo do
	  smid "sm3402368"
	  flvinfo "thread_id=1211478436&l=334&url=http%3A%2F%2Fsmile-cln67.nicovideo.jp%2Fsmile%3Fm%3D27404927.96536&ms=http%3A%2F%2Fmsg.nicovideo.jp%2F7%2Fapi%2F&ms_sub=http%3A%2F%2Fsub.msg.nicovideo.jp%2F7%2Fapi%2F&deleted=1&user_id=20099307&is_premium=0&nickname=lessi&time=1449831466622&done=true&ng_rv=5&hms=hiroba.nicovideo.jp&hmsp=2593&hmst=690&hmstk=1449831526.j2UMDJ3WOq8H10zwUr5q6V8n-kI&userkey=1449833266.%7E1%7E3VTNscMnWudg2DAG-9p0hdhfBFOJzrT2CwN7Tdi-iEY"
  end

  factory :sm13, class: Cacheflvinfo do
	  smid "sm13"
	  flvinfo "thread_id=1173120219&l=35&url=http%3A%2F%2Fsmile-com23.nicovideo.jp%2Fsmile%3Fm%3D13.0989low&ms=http%3A%2F%2Fmsg.nicovideo.jp%2F43%2Fapi%2F&ms_sub=http%3A%2F%2Fsub.msg.nicovideo.jp%2F43%2Fapi%2F&user_id=20099307&is_premium=0&nickname=lessi&time=1449831622239&done=true&ng_rv=5&hms=hiroba.nicovideo.jp&hmsp=2603&hmst=790&hmstk=1449831682.HFPHL4O6tXb4i_tzJt3o9ikqtSg&userkey=1449833422.%7E1%7ED8sotLO481HNn9ahjgNoVwmZQ_Ik99YmP8AfF1uyQZk"
  end
end
