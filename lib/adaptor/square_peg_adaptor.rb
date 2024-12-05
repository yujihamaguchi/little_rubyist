# frozen_string_literal: true

class SquarePegAdaptor < RoundPeg
  def initialize(square_peg:)
    @square_peg = square_peg
    super(radius: nil)
  end

  def radius
    @square_peg.width / Math.sqrt(2)
  end
end
