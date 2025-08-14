# frozen_string_literal: true

require_relative "shape"
class Dot
  include Shape
  attr_reader :x, :y

  def initialize(x:, y:)
    @x = x
    @y = y
  end

  def delegate_to(visitor)
    visitor.visit_dot(self)
  end
end
