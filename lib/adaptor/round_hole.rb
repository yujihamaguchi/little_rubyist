# frozen_string_literal: true

class RoundHole
  def initialize(radius:)
    @radius = radius
  end

  def fits?(peg)
    @radius >= peg.radius
  end
end
