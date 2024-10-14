# frozen_string_literal: true

require_relative "../test_helper"

require "adaptor/round_hole"
require "adaptor/square_peg"

class RoundHoleE2eTest < Minitest::Test
  def test_fits_square_peg
    # Arrange
    radius = 5
    width = radius * Math.sqrt(2)
    hole = RoundHole.new(radius: radius)
    square_peg = SquarePeg.new(width: width)
    large_square_peg = SquarePeg.new(width: width + 1)

    # Assert
    assert hole.fits(square_peg)
    assert !hole.fits(large_square_peg)
  end
end
