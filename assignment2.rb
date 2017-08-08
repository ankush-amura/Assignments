def high_and_low(string)
return nil if string==""
ans=""
arr=string.split(' ').map!{|x| x.to_i}
ans.concat("#{arr.max}")
ans.concat(" #{arr.min}")
ans
end

p high_and_low("1 10 -100 -001 1000")
