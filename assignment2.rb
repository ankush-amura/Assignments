def process(string)
ans=""
ans.concat(string.split(' ').max)
ans.concat(" #{string.split(' ').min}")
ans
end

p process("1 2 3 4 5")
