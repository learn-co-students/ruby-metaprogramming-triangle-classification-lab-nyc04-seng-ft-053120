require 'pry'
class Triangle
  attr_accessor :a, :b, :c

  def initialize(a, b, c)
    @a = a
    @b = b
    @c = c
    @all_sides = [a, b, c]
  end

  def valid_triangle?
    valid = [(a + b > c), (b + c > a), (c + a > b)]
    @all_sides.each do |side|
      valid << false if side <= 0
    end
    valid.include?(false) ? false : true
  end

  def kind
    if !valid_triangle?
        raise TriangleError
    elsif a == b && b == c
      :equilateral
    elsif a == b || b == c || c == a
      :isosceles
    else
      :scalene
    end
  end

  class TriangleError < StandardError
  end

end
