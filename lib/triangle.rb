require "pry"
class Triangle
  # write code here

  attr_accessor :side0, :side1, :side2
  attr_reader :kind

  def initialize(side0, side1, side2)

    @side0 = side0
    @side1 = side1
    @side2 = side2

    if ((@side1 + @side2) <= @side0 || (@side0 + @side2) <= @side1 || (@side0 + @side1) <= @side2 || @side0 <= 0 || @side1 <= 0 || @side2 <= 0)
        raise TriangleError
    elsif (@side0 == @side1 && @side0 == @side2)
      @kind = :equilateral
    elsif (@side0 == @side1 || @side0 == @side2 || @side1 == @side2)
      @kind = :isosceles
    else
      @kind = :scalene
    end

  end

  class TriangleError < StandardError
    def message
      "Invalid Triangle"
    end
  end
end
