require 'pry'

class Triangle
  attr_reader :side1, :side2, :side3, :equilateral, :isosceles, :isosceles

  def initialize(side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
  end

  def equilateral
    side1 == side2 && side1 == side3 && side2 == side3
  end

  def isosceles
    side1 == side2 || side1 == side3 || side2 == side3
  end

  def scalene
    side1 != side2 && side1 != side3 && side2 != side3
  end

  def valid_triangle
    (side1 > 0 || side2 > 0 || side3 > 0) && (side1 + side2 > side3 && side2 + side3 > side1 && side3 + side1 > side2)
  end

  def kind
    if valid_triangle == false
      raise TriangleError
    else
      case valid_triangle
      when equilateral
        :equilateral
      when isosceles
        :isosceles
      when scalene
        :scalene
      end
    end
  end

  class TriangleError < StandardError
    def message
      'Triangles are invalid'
    end
  end
end
