# dahserize the passsed number if the adjacent numbers are odd
def dasherize(number="")
   # handling if the passed string is nil
   return "" if(number==nil)
   # provides us with each single digit in the number
   numbers=number.split('')
   # this loop replaces the number with (-number) on true condition
   numbers.each_with_index do |item,index|
      numbers[index]="-#{item}" if(numbers[index-1].to_i%2!=0 && numbers[index].to_i%2!=0)
   end
# returning the result   
numbers.join
end
p dasherize("112233445566")
