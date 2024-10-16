# frozen_string_literal: true

class RoundHole
  attr_reader :radius

  def initialize(radius:)
    @radius = radius
  end

  def fits(peg)
    peg.fits(self)
  end
end
