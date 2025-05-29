# frozen_string_literal: true

require_relative "radius_provider"
class SquarePegAdapter
  include RadiusProvider
  def initialize(square_peg:)
    @square_peg = square_peg
  end

  def radius
    @square_peg.width / Math.sqrt(2)
  end
end
