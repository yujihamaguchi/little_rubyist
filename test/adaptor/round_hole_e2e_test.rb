# frozen_string_literal: true

require_relative "../test_helper"

require "adaptor/round_peg"
require "adaptor/round_hole"
require "adaptor/square_peg"

class RoundHoleE2eTest < Minitest::Test
  def test_fits_round_peg
    # Arrange
    hole = RoundHole.new(radius: 5)
    round_peg = RoundPeg.new(radius: 5)

    # Assert
    assert hole.fits(round_peg)
  end

  def test_fits_square_peg
    # Arrange
    radius = 5
    width = radius / Math.sqrt(2) * 2
    hole = RoundHole.new(radius: radius)
    square_peg = SquarePeg.new(width: width)

    # Assert
    assert hole.fits(square_peg)
  end

  # sqrt 2 : 1 = 5 : x
  def test_not_fits_square_peg
    # Arrange
    radius = 5
    width = radius * Math.sqrt(2)
    hole = RoundHole.new(radius: radius)
    large_square_peg = SquarePeg.new(width: width + 1)

    # Assert
    assert !hole.fits(large_square_peg)
  end
end
