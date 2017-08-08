def solution(hash)
str=""
  hash.each do |key,value|
    str.concat("#{key}=#{value},")
  end
  str[str.length-1]=""
  str
end

p solution({a:1,b:'2'})
