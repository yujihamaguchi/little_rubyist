# frozen_string_literal: true

class SquarePeg
  def initialize(width:)
    @width = width
  end

  def fits?(hole)
    @width <= hole.radius / Math.sqrt(2) * 2
  end
end
