
def sol_equa(n)
  arr=[]
  [*1..n].combination(2) do |x,y|
    p "#{x} and #{y}"
  end
end
p sol_equa(25000)
