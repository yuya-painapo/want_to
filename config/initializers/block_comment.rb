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

  return vpos_seconds
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
  start_time = Array.new(m_division)
  end_time = Array.new(m_division)
  i = 0

  time_range.each do |time| 
    sec = (time + 100) / 100
    min = sec / 60
    ss = sprintf("%02d", sec % 60)
    start_time[i] = min.to_s + ':' + ss.to_s
    i = i + 1  
  end
  start_time.unshift 0
  start_time.pop 

  i = 0
  time_range.each do |time|
    sec = time / 100
    min = sec / 60
    ss = sprintf("%02d", sec % 60)
    end_time[i] = min.to_s + ':' + ss.to_s
    i = i + 1
  end

  return start_time,end_time
end


def plus_time(time_range)
  start_time = time_range.map { |i| (i + 100) / 100 }
  start_time.unshift 0
  start_time.pop 

  return start_time
end


def get_threshold(block_com_num)
  avg = block_com_num.inject(0.0){|r,i| r+=i }/block_com_num.size
  variance = block_com_num.inject(0.0){|r,i| r+=(i.to_i-avg)**2 }/block_com_num.size
  standard_deviation = Math.sqrt(variance)
  value = avg + standard_deviation

  return value
end


def get_highlight_place(threshold,com_num,start_time,finish_time)
  start = []
  finish = []
  com_num.length.times do |i|
    if com_num[i] > threshold
      start.push start_time[i]
      finish.push finish_time[i]
    end
  end
  start_finish = start.zip(finish)
  
  return start_finish
end


