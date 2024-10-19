# frozen_string_literal: true

require_relative "../test_helper"

require "adaptor/round_peg"
require "adaptor/round_hole"
require "adaptor/square_peg"
require "adaptor/square_peg_adaptor"

class RoundHoleE2eTest < Minitest::Test
  def test_fits_round_peg
    # Arrange
    hole = RoundHole.new(radius: 5)
    round_peg = RoundPeg.new(radius: 5)

    # Assert
    assert hole.fits?(round_peg)
  end

  def test_fits_square_peg
    # Arrange
    hole = RoundHole.new(radius: 5)
    square_peg = SquarePeg.new(width: 5 * Math.sqrt(2))
    square_peg_adaptor = SquarePegAdaptor.new(square_peg: square_peg)

    # Assert
    assert hole.fits?(square_peg_adaptor)
  end

  def test_not_fits_square_peg
    # Arrange
    round_hole = RoundHole.new(radius: 5)
    square_peg = SquarePeg.new(width: 5 * Math.sqrt(2) + 1)
    square_peg_adaptor = SquarePegAdaptor.new(square_peg: square_peg)

    # Assert
    assert !round_hole.fits?(square_peg_adaptor)
  end
end
