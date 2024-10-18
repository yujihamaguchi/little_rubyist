# frozen_string_literal: true

class RoundPeg
  attr_reader :radius

  def initialize(radius:)
    @radius = radius
  end

  def fits?(hole)
    @radius <= hole.radius
  end
end
