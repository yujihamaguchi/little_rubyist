# frozen_string_literal: true

class RoundHole
  def initialize(radius:)
    @radius = radius
  end

  def fits(square)
    raise NotImplementedError
  end
end
