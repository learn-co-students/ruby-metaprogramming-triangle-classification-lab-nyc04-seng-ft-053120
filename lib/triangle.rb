class Triangle
  # write code here
  attr_accessor :s1, :s2, :s3

  def initialize (s1,s2,s3)
    @s1=s1
    @s2=s2
    @s3=s3
  end

  def kind
    if @s1<=0 or @s2<=0 or @s3<=0 or @s1+@s2<=@s3 or @s2+@s3<=@s1 or @s1+@s3<=@s2
      raise TriangleError
    elsif @s1==@s2 and @s2==@s3
      return "equilateral".to_sym
    elsif @s1==@s2 or @s2==@s3 or @s1==@s3
      return "isosceles".to_sym
    else @s1!=@s2 or @s2!=@s3 or @s1!=@s3
      return "scalene".to_sym
    end
  end

 
  class TriangleError < StandardError
  end
end
    
