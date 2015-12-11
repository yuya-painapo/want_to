# coding: utf-8
require 'factory_girl'

FactoryGirl.define do
  factory :sm9, class: Cacheflvinfo do
    smid "sm9"
    flvinfo {
		{:thread_id=>"1173108780", :l=>"319", :url=>"http%3A%2F%2Fsmile-com42.nicovideo.jp%2Fsmile%3Fm%3D9.0468low", :ms=>"http%3A%2F%2Fmsg.nicovideo.jp%2F10%2Fapi%2F", :ms_sub=>"http%3A%2F%2Fsub.msg.nicovideo.jp%2F10%2Fapi%2F", :user_id=>"20099307", :is_premium=>"0", :nickname=>"lessi", :time=>"1449760880816", :done=>"true", :ng_rv=>"5", :hms=>"hiroba.nicovideo.jp", :hmsp=>"2606", :hmst=>"820", :hmstk=>"1449760940.8Eg4kyj0yYqysugf3wY-WdTgCII", :userkey=>"1449762680.%7E1%7EhNfzdteL-QGEXZR4jkKpccpu6C61sudYI4Xm2-Dk_bk"}}
	initialize_with { new(attributes) }
  end

  factory :sm32, class: Cacheflvinfo do
	  smid "sm32"
	  flvinfo {{:error=>"invalid_v1", :done=>"true\n"}}
	initialize_with { new(attributes) }
  end

  factory :so23698047, class: Cacheflvinfo do
	  smid "so23698047"
	  flvinfo {{:error=>"invalid_v1", :done=>"true\n"}}
	initialize_with { new(attributes) }
  end

  factory :"1381804974", class: Cacheflvinfo do
	  smid "1381804974"
	  flvinfo {{:thread_id=>"1381804974", :l=>"1441", :url=>"http%3A%2F%2Fsmile-cln62.nicovideo.jp%2Fsmile%3Fm%3D22048157.34040low", :ms=>"http%3A%2F%2Fmsg.nicovideo.jp%2F3%2Fapi%2F", :ms_sub=>"http%3A%2F%2Fsub.msg.nicovideo.jp%2F3%2Fapi%2F", :user_id=>"20099307", :is_premium=>"0", :nickname=>"lessi", :time=>"1449760881189", :done=>"true", :needs_key=>"1", :optional_thread_id=>"1381804973", :ng_rv=>"5", :ng_ch=>"%252F%252Afeir.tk%3D%26%252F%252A%255BwW%25EF%25BD%2597%25EF%25BC%25B7%255D%255B.%252C%25E3%2580%2581%25E3%2580%2582%252F%25E3%2583%25BB%255C%25EF%25BF%25A5%253B%25EF%25BC%259B%253A%25EF%25BC%259A%255D%3D%26%252F%252A%255BfF%25EF%25BD%2586%25EF%25BC%25A6%255D%255BeE%25EF%25BD%2585%25EF%25BC%25A5%255D%255BiI%25EF%25BD%2589%25EF%25BC%25A9%255D%3D%26%252F%252A%255BhH%25EF%25BD%2588%25EF%25BC%25A8%255D%255BtT%25EF%25BD%2594%25EF%25BC%25B4%255D%255BtT%25EF%25BD%2594%25EF%25BC%25B4%255D%255BpP%25EF%25BD%2590%25EF%25BC%25B0%255D%255B%253A%25EF%25BC%259A%255D%3D%26%252F%252A%255BfF%25EF%25BD%2586%25EF%25BC%25A6%255D%255B%2520%25E3%2580%2580%255D%252B%255BeE%25EF%25BD%2585%25EF%25BC%25A5%255D%3D%26%252F%252A%255BeE%25EF%25BD%2585%25EF%25BC%25A5%255D%255B%2520%25E3%2580%2580%255D%252B%255BiI%25EF%25BD%2589%25EF%25BC%25A9%255D%3D%26%252F%252A%255BwW%25EF%25BD%2597%25EF%25BC%25B7%255D%255B%2520%25E3%2580%2580%255D%252B%255B.%252C%25E3%2580%2581%25E3%2580%2582%252F%25E3%2583%25BB%255C%25EF%25BF%25A5%253B%25EF%25BC%259B%253A%25EF%25BC%259A%255D%3D%26%252F%252A%255B.%252C%25E3%2580%2581%25E3%2580%2582%252F%25E3%2583%25BB%255C%25EF%25BF%25A5%253B%25EF%25BC%259B%253A%25EF%25BC%259A%255D%255BtT%25EF%25BD%2594%25EF%25BC%25B4cC%25EF%25BD%2583%25EF%25BC%25A3jJ%25EF%25BD%258A%25EF%25BC%25AAuU%25EF%25BD%2595%25EF%25BC%25B5iI%25EF%25BD%2589%25EF%25BC%25A9uU%25EF%25BD%2595%25EF%25BC%25B5nN%25EF%25BD%258E%25EF%25BC%25AEbB%25EF%25BD%2582%25EF%25BC%25A2%255D%3D%26%252F%252A%255B.%252C%25E3%2580%2581%25E3%2580%2582%252F%25E3%2583%25BB%255C%25EF%25BF%25A5%253B%25EF%25BC%259B%253A%25EF%25BC%259A%255D%255B%2520%25E3%2580%2580%255D%252B%255BtT%25EF%25BD%2594%25EF%25BC%25B4cC%25EF%25BD%2583%25EF%25BC%25A3jJ%25EF%25BD%258A%25EF%25BC%25AAuU%25EF%25BD%2595%25EF%25BC%25B5iI%25EF%25BD%2589%25EF%25BC%25A9uU%25EF%25BD%2595%25EF%25BC%25B5nN%25EF%25BD%258E%25EF%25BC%25AEbB%25EF%25BD%2582%25EF%25BC%25A2%255D%3D%26%252F%252A.%252A%255BwW%25EF%25BD%2597%25EF%25BC%25B7%255D.%252A%255BwW%25EF%25BD%2597%25EF%25BC%25B7%255D.%252A%255BwW%25EF%25BD%2597%25EF%25BC%25B7%255D.%252A%255BtT%25EF%25BD%2594%25EF%25BC%25B4%25CE%25A4%25CF%2584%255D.%252A%255BkK%25EF%25BD%258B%25EF%25BC%25AB%25CE%259A%25CE%25BA%255D.%252A%3D%26%252F%252A.%252A%255BaA%25EF%25BD%2581%25EF%25BC%25A1eE%25EF%25BD%2585%25EF%25BC%25A5%255D.%252A%255BtT%25EF%25BD%2594%25EF%25BC%25B4%255D.%252A%255BkK%25EF%25BD%258B%25EF%25BC%25AB%255D.%252A%3D%26%252F%252A%255BeE%25EF%25BD%2585%25EF%25BC%25A5%255D%255BrR%25EF%25BD%2592%25EF%25BC%25B2%255D%255BqQ%25EF%25BD%2591%25EF%25BC%25B1%255D%3D%26%252F%252A%255BeE%25EF%25BD%2585%25EF%25BC%25A5%255D%255B%2520%25E3%2580%2580%255D%252B%255BrR%25EF%25BD%2592%25EF%25BC%25B2%255D%3D%26%252F%252A%255BrR%25EF%25BD%2592%25EF%25BC%25B2%255D%255B%2520%25E3%2580%2580%255D%252B%255BqQ%25EF%25BD%2591%25EF%25BC%25B1%255D%3D%26%252F%252A.%252A%255BwW%25EF%25BD%2597%25EF%25BC%25B7%255D.%252A%255BwW%25EF%25BD%2597%25EF%25BC%25B7%255D.%252A%255BwW%25EF%25BD%2597%25EF%25BC%25B7%255D.%252A%255BtT%25EF%25BD%2594%25EF%25BC%25B4cC%25EF%25BD%2583%25EF%25BC%25A3jJ%25EF%25BD%258A%25EF%25BC%25AAuU%25EF%25BD%2595%25EF%25BC%25B5iI%25EF%25BD%2589%25EF%25BC%25A9uU%25EF%25BD%2595%25EF%25BC%25B5nN%25EF%25BD%258E%25EF%25BC%25AEbB%25EF%25BD%2582%25EF%25BC%25A2%255D.%252A%3D%26%252F%252A.%252A%255BbB%25EF%25BD%2582%25EF%25BC%25A2%255D.%252A%255BiI%25EF%25BD%2589%25EF%25BC%25A9%255D.%252A%255BtT%25EF%25BD%2594%25EF%25BC%25B4%25CE%25A4%25CF%2584%255D.%252A%255BlL%25EF%25BD%258C%25EF%25BC%25AC%255D.%252A%255ByY%25EF%25BD%2599%25EF%25BC%25B9%255D.%252A%3D%26%252F%252A.%252A%255BpP%25EF%25BD%2590%25EF%25BC%25B0%255D.%252A%255BoO%25EF%25BD%258F%25EF%25BC%25AF%255D.%252A%255BoO%25EF%25BD%258F%25EF%25BC%25AF%255D.%252A%255BtT%25EF%25BD%2594%25EF%25BC%25B4%25CE%25A4%25CF%2584%255D.%252A%3D%26%252F%252A.%252A%255BpP%25EF%25BD%2590%25EF%25BC%25B0%255D.%252A%255BoO%25EF%25BD%258F%25EF%25BC%25AF%255D.%252A%255BoO%25EF%25BD%258F%25EF%25BC%25AF%255D.%252A%255BsS%25EF%25BD%2593%25EF%25BC%25B3%255D.%252A%3D", :hms=>"hiroba.nicovideo.jp", :hmsp=>"2555", :hmst=>"310", :hmstk=>"1449760941.yrVPjM7sI0chTbED0OKnF1VNON0", :userkey=>"1449762681.%7E1%7Er4d_c9Xl0NNpUioF-7p3EeRJBR15XVVpqNEiak14Wio"}}
	initialize_with { new(attributes) }
  end

  factory :sm17524387, class: Cacheflvinfo do
	  smid "sm17524387"
	  flvinfo {{:thread_id=>"1334161854", :l=>"708", :url=>"http%3A%2F%2Fsmile-cln21.nicovideo.jp%2Fsmile%3Fm%3D17524387.26128", :ms=>"http%3A%2F%2Fmsg.nicovideo.jp%2F38%2Fapi%2F", :ms_sub=>"http%3A%2F%2Fsub.msg.nicovideo.jp%2F38%2Fapi%2F", :user_id=>"20099307", :is_premium=>"0", :nickname=>"lessi", :time=>"1449781974623", :done=>"true", :ng_rv=>"5", :hms=>"hiroba.nicovideo.jp", :hmsp=>"2551", :hmst=>"270", :hmstk=>"1449782034.uIFyGC_cNcVXBprEPOBH2VKX9pE", :userkey=>"1449783774.%7E1%7EDnLG2ScZGDuIgKIPbvbQMR1Yp51RObSFcfPp23KKja8"}}
	initialize_with { new(attributes) }
  end

  factory :za3028319, class: Cacheflvinfo do
	  smid "za3028319"
	  flvinfo {{:thread_id=>"1208524072", :l=>"834", :url=>"http%3A%2F%2Fsmile-cln39.nicovideo.jp%2Fsmile%3Fm%3D27404936.42255", :ms=>"http%3A%2F%2Fmsg.nicovideo.jp%2F36%2Fapi%2F", :ms_sub=>"http%3A%2F%2Fsub.msg.nicovideo.jp%2F36%2Fapi%2F", :user_id=>"20099307", :is_premium=>"0", :nickname=>"lessi", :time=>"1449781974742", :done=>"true", :ng_rv=>"5", :hms=>"hiroba.nicovideo.jp", :hmsp=>"2552", :hmst=>"280", :hmstk=>"1449782034.cDUV2Tn5gsR6QPk6kcI_86PqNsg", :userkey=>"1449783774.%7E1%7EDnLG2ScZGDuIgKIPbvbQMR1Yp51RObSFcfPp23KKja8"}}
	initialize_with { new(attributes) }
  end

  factory :sm20652382, class: Cacheflvinfo do
	  smid "sm20652382"
	  flvinfo {{:thread_id=>"1366445276", :l=>"598", :url=>"http%3A%2F%2Fsmile-cln53.nicovideo.jp%2Fsmile%3Fm%3D20652382.51419", :ms=>"http%3A%2F%2Fmsg.nicovideo.jp%2F38%2Fapi%2F", :ms_sub=>"http%3A%2F%2Fsub.msg.nicovideo.jp%2F38%2Fapi%2F", :user_id=>"20099307", :is_premium=>"0", :nickname=>"lessi", :time=>"1449760880692", :done=>"true", :ng_rv=>"5", :hms=>"hiroba.nicovideo.jp", :hmsp=>"2542", :hmst=>"180", :hmstk=>"1449760940.yixZtnSNBaVxeEHyzLVWcAFGdMo", :userkey=>"1449762680.%7E1%7EhNfzdteL-QGEXZR4jkKpccpu6C61sudYI4Xm2-Dk_bk"}}
	initialize_with { new(attributes) }
  end

  factory :sm20628576, class: Cacheflvinfo do
	  smid "sm20628576"
	  flvinfo {{:thread_id=>"1366174930", :l=>"599", :url=>"http%3A%2F%2Fsmile-cln16.nicovideo.jp%2Fsmile%3Fm%3D20628576.85368", :ms=>"http%3A%2F%2Fmsg.nicovideo.jp%2F37%2Fapi%2F", :ms_sub=>"http%3A%2F%2Fsub.msg.nicovideo.jp%2F37%2Fapi%2F", :user_id=>"20099307", :is_premium=>"0", :nickname=>"lessi", :time=>"1449781974859", :done=>"true", :ng_rv=>"5", :hms=>"hiroba.nicovideo.jp", :hmsp=>"2551", :hmst=>"270", :hmstk=>"1449782034.uIFyGC_cNcVXBprEPOBH2VKX9pE", :userkey=>"1449783774.%7E1%7EDnLG2ScZGDuIgKIPbvbQMR1Yp51RObSFcfPp23KKja8"}}
	initialize_with { new(attributes) }
  end

  factory :sm3402368, class: Cacheflvinfo do
	  smid "sm3402368"
	  flvinfo {{:error=>"access_locked", :done=>"true\n"}}
	initialize_with { new(attributes) }
  end

  factory :sm13, class: Cacheflvinfo do
	  smid "sm13"
	  flvinfo {{:thread_id=>"1173120219", :l=>"35", :url=>"http%3A%2F%2Fsmile-com23.nicovideo.jp%2Fsmile%3Fv%3D13.0989", :ms=>"http%3A%2F%2Fmsg.nicovideo.jp%2F43%2Fapi%2F", :ms_sub=>"http%3A%2F%2Fsub.msg.nicovideo.jp%2F43%2Fapi%2F", :user_id=>"20099307", :is_premium=>"0", :nickname=>"lessi", :time=>"1449821133095", :done=>"true", :ng_rv=>"5", :hms=>"hiroba.nicovideo.jp", :hmsp=>"2599", :hmst=>"750", :hmstk=>"1449821193.lzY_ayVbnBaiHPaCxZhypoRXvIQ", :userkey=>"1449822933.%7E1%7EKAeUDlm4QgbOTZLC2Rd4NvBFTQrorsMZ2qMWzYsklaI"}}
	initialize_with { new(attributes) }
  end
end
