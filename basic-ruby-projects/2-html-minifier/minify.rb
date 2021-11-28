print "Enter the file name: "
filename = gets.chomp
new_filename = "minified_" + filename 
puts ".. generating [#{new_filename}]"
file = File.open(filename, 'r')
file2 = File.open(new_filename, 'w')

while file.eof? != true 
  str = file.gets.strip.chomp
  while str.include? "<!--"
    str = str.slice(0, str.index("<!--")).strip.chomp
  end 
  file2.write str
end 
puts ".. DONE"

file.close
file2.close
