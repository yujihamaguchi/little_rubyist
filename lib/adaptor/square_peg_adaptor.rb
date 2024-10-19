# frozen_string_literal: true

class SquarePegAdaptor < RoundPeg
  def initialize(square_peg:)
    @square_peg = square_peg
  end

  def radius
    @square_peg.width / Math.sqrt(2)
  end
end

# peg.getWidth() * Math.sqrt(2) / 2
# @square_peg.width / Math.sqrt(2)
