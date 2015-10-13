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
