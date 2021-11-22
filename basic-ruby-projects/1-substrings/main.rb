def substrings(str, dict)
  myhash = Hash.new(0)
  temp = str.split(' ').map! { |word| word.downcase }
  str = temp.join(' ')
  puts str
  dict.each do |word| 
    if str.include? word
      myhash[word] = str.scan(/(?=#{word})/).count
    end 
  end 

  myhash
end 

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

# { "below" => 1, "low" => 1 }
puts substrings("below", dictionary)

#   => { "down" => 1, "go" => 1, "going" => 1, "how" => 2, "howdy" => 1, "it" => 2, "i" => 3, "own" => 1, "part" => 1, "partner" => 1, "sit" => 1 }
puts substrings("Howdy partner, sit down! How's it going?", dictionary)
