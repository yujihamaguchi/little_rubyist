# frozen_string_literal: true

require_relative "radius"
class SquarePegToRoundHoleAdapter
  include Radius
  def initialize(adaptee:)
    @square_peg = adaptee
  end

  def radius
    @square_peg.width / Math.sqrt(2)
  end
end
