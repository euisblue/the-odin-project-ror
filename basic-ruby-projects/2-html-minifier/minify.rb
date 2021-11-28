filename = "test.html"
new_filename = "minified_" + filename 
file = File.open(filename, 'r')
file2 = File.open(new_filename, 'w')

while file.eof? != true 
  str = file.gets.strip.chomp
  while str.include? "<!--"
    str = str.slice(0, str.index("<!--")).strip.chomp
  end 
  file2.write str
end 

file.close
file2.close
