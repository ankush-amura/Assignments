def process(string)
return nil if string=""
ans=""
arr=string.split(' ').map!{|x| x.to_i}
ans.concat("#{arr.max}")
ans.concat(" #{arr.min}")
ans
end

p process("1 2 3 10 1000 0001")
