class Triangle
  attr_reader :side_1, :side_2, :side_3
  
  def initialize(side_1, side_2, side_3)
    @side_1 = side_1
    @side_2 = side_2
    @side_3 = side_3
  end

  def equilateral?
    # helper function that returns true if triangle has all sides that are the same
    side_1 == side_2 && side_1 == side_3 && side_2 == side_3
  end

  def isosceles?
    # helper function that returns true if the triangle has at least 2 sides that are the same
    side_1 == side_2 || side_1 == side_3 || side_2 == side_3
  end

  def scalene?
    # helper function that returns true if the triangle has no equal sides 
    side_1 != side_2 && side_1 != side_3 && side_2 != side_3
  end

  def is_valid?
    # The sum of the lengths of any two sides of a triangle always exceeds the length of the third side
    # Further, each side must be larger than 0.

    (side_1 + side_2 > side_3 && side_2 + side_3 > side_1 && side_3 + side_1 > side_2) &&
    (side_1 > 0 || side_2 > 0 || side_3 > 0)
  end

  def kind
    if !self.is_valid?
      # If triangle is not valid, raise TriangleError, which will automatically output custom message as defined below
      raise TriangleError
    else
      return :equilateral if self.equilateral?
      return :isosceles if self.isosceles?
      return :scalene if self.scalene?
    end
  end

  class TriangleError < StandardError
    # Have TriangleError inherit from StandardError, affix custom message
    def message
      "Not a valid triangle. The sum of the lengths of any two sides of a triangle always exceeds the length of the third side."
    end
  end
end