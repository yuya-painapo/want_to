require 'net/https'
require 'uri'
require 'rexml/document'

def nicovideo_length (video_id)
  host = 'http://ext.nicovideo.jp'
  path = "/api/getthumbinfo/#{video_id}"
  request = host + path
  uri = URI.parse(request)
  xml = Net::HTTP.get(uri)
  doc = REXML::Document.new(xml)
  video_length = doc.elements['nicovideo_thumb_response/thumb/length'].text

  minutes = video_length[/(.*):(.*)/,1]
  seconds = video_length[/(.*):(.*)/,2]
  total_seconds = minutes.to_i*60 + seconds.to_i
  vpos_seconds = total_seconds*100 + 99

  return (vpos_seconds)
end


def divide_equally(n, m)
  block = Array.new(m, n / m)
  time_range = Array.new(m)
  sum = 0;

  (n % m).times do |i|
    block[i] += 1
  end
  
  block.length.times do |i|
    time_range[i] = sum + block[i]
    sum  +=  block[i]   
  end   
 
  return time_range
end


def get_comment_number(time_range, comments, m_division)
  com_num = Array.new(m_division,0)
  
  comments.each do |com| 
    m_division.times do |i|
     if com['chat']['vpos'] <= time_range[i]
        com_num[i] += 1
        break
      end  
    end
  end
  return com_num
end


def from_vpos_to_time(time_range, m_division)
  v_time = Array.new(m_division)
  i = 0

  time_range.each do |time| 
    sec = (time + 100) / 100
    min = sec / 60
    ss = sprintf("%02d", sec % 60)
    v_time[i] = min.to_s + ':' + ss.to_s
    i = i + 1  
  end
  v_time.unshift 0
  v_time.pop 
  
  return v_time
end


def plus_time(time_range)
  start_time = time_range.map { |i| (i + 100) / 100 }
  start_time.unshift 0
  start_time.pop 

  return start_time
end


def get_threshold(array)
  avg = array.inject(0.0){|r,i| r+=i }/array.size
  variance = array.inject(0.0){|r,i| r+=(i.to_i-avg)**2 }/array.size
  standard_deviation = Math.sqrt(variance)
  value = avg + standard_deviation

  return value
end


def get_highlight_place(threshold,com_num,time)
  select_num = []
  select_place = []
  com_num.length.times do |i|
    if com_num[i] > threshold
      select_num.push i
    end
  end

  select_num.length.times do |i|
    select_place.push time[select_num[i]]
  end

  return select_place
end
