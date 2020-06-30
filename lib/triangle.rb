class Triangle
  attr_reader :sides, :uniq_sides

  def initialize(s1, s2, s3)
    @sides = [s1, s2, s3]
    @uniq_sides = @sides.uniq.size
  end

  def kind
    self.valid_triangle?
    return :equilateral if @uniq_sides == 1
    return :isosceles if @uniq_sides == 2
    return :scalene if @uniq_sides == 3
  end

  def valid_triangle?
    result = has_three_sides? && no_zero_sides? && triangle_inequality?
    
    raise TriangleError if result == false
    
    result
  end

  def has_three_sides?
    @sides.length == 3
  end
  
  def no_zero_sides?
    @sides.all?(&:positive?)
  end

  def triangle_inequality?
    @sides.min(2).sum > @sides.max
  end

  class TriangleError < StandardError
  end
end