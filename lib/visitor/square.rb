# frozen_string_literal: true

require_relative "shape"

class Square
  include Shape
  attr_reader :x, :y, :w

  def initialize(x:, y:, w:)
    @x = x
    @y = y
    @w = w
  end

  def accept(visitor)
    visitor.visit_square(self)
  end
end
