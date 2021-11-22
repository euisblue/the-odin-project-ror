class String
  def alpha?
    !!match(/^[[:alpha:]]+$/)
  end

  def uppercase?
    !!match(/^[A-Z]$/)
  end

  def lowercase?
    !!match(/^[a-z]$/)
  end
end

def encode(str, offset)
  len = str.length
  for i in 0...len do
    if str[i].alpha? 
      if str[i].uppercase?
        temp = (str[i].ord + offset) % 91
        temp = temp < 65 ? temp + 65 : temp
        str[i] = temp.chr
      else 
        temp = (str[i].ord + offset) % 123
        temp = temp < 97 ? temp + 97 : temp
        str[i] = temp.chr
      end
    end
  end

  str
end

def decode(str, offset)
  len = str.length
  for i in 0...len do
    if str[i].alpha? 
      temp = str[i].ord - offset
      if str[i].uppercase?
        temp = temp < 65 ? 91 - (65 - temp) : temp  
      else 
        temp = temp < 97 ? 123 - (97 - temp) : temp  
      end
      str[i] = temp.chr
    end
  end

  str
end

while true do 
  puts " 1) Encode      2) Decode      0) Quit"
  print "> "
  option = gets.chomp.to_i

  while option < 0 or option > 2 
    puts "... 1) Encode      2) Decode      0) Quit"
    option = gets.chomp.to_i
  end 

  break if option == 0 

  puts "Enter a message. "
  print "> "
  msg = gets.chomp 
  puts "Shift by.. "
  print "> "
  offset = (gets.chomp.to_i) % 26

  puts "======================"
  if option == 1
      puts encode(msg, offset)
  else 
      puts decode(msg, offset) 
  end 
  puts "======================"
end
