def multiples(x=2,n=1)
 # return numbers till x when n=1 or n=0
 [*0..x-1].join(' ') if(n==0||n==1)
 # initialise the number from 0 that goes to x furthur
 i=0
 arr=[]
 while arr.size!=x
  # pushing elements onto array when condition applies
  arr.push(i) if(!(i%n==0) || i==0)
  i+=1
 end
  # returning the final array
  arr
end

p multiples(20,2)
