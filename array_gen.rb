require "benchmark"

def array_gen(size=0)
  return [] if size==nil
  size>0 ? Array.new(size+1){|i| [*0..i].reduce(:+)} : Array.new(size.abs+1){|i| -[*0..i].reduce(:+)}
end
p array_gen(nil)
