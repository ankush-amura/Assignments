class A
  def initialize

  end
  def add
   p "i am in class a"
  end
end
class B < A
 def initialize

 end
  def add
    super()
    p "i am in class B"
  end
end


B.new.send(:add)
