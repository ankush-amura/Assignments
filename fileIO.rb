# default set to empty array
def fileIO(list=[])
# returns if the list is found empty
return if(list.empty? || list==nil)
  arr=[]
  # opening file in write mode
  file=File.open('text1.txt','w')
  list.each do |name|
    # writes list of names to the first file
    file.write("#{name}\n")
  end
  file.close
  puts 'press 1 to sort names with A-Z order'
  puts 'press 2 to sort names with Z-A order'
  # decides sorting from the user input
  num=gets.chomp!.to_i
  File.open('text1.txt','r').each do |line|
    arr.push(line)
  end
  arr.sort_by!(&:downcase)
  case num
    when 1  then arr
    when 2  then arr.reverse!
  end
  arr.each do |element|
    # write sorted data to file
    File.open('text2.txt','a').write(element)
  end
end

fileIO(%w[adams adam johns bozo nicholas])
