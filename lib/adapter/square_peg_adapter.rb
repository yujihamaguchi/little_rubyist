# frozen_string_literal: true

class SquarePegAdapter
  def initialize(square_peg:)
    @square_peg = square_peg
  end

  def radius
    @square_peg.width / Math.sqrt(2)
  end
end
