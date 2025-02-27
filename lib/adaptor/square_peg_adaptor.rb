# frozen_string_literal: true

require_relative "round_peg"

class SquarePegAdaptor < RoundPeg
  def initialize(square_peg:)
    @square_peg = square_peg
    super(radius: nil)
  end

  def radius
    @square_peg.width / Math.sqrt(2)
  end
end
