# frozen_string_literal: true

require_relative "shape"
class Circle
  include Shape
  attr_reader :x, :y, :r

  def initialize(x:, y:, r:)
    @x = x
    @y = y
    @r = r
  end

  def accept(visitor)
    visitor.visit_circle(self)
  end
end
