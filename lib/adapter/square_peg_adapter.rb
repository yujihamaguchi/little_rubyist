# frozen_string_literal: true

require_relative "radius"

class SquarePegAdapter
  include Radius

  def initialize(square_peg:)
    @square_peg = square_peg
  end

  def radius
    @square_peg.width / Math.sqrt(2)
  end
end
