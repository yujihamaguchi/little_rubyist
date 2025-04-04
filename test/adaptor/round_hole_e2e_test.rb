# frozen_string_literal: true

require_relative "../test_helper"

require_relative "../../lib/adaptor/round_peg"
require_relative "../../lib/adaptor/round_hole"
require_relative "../../lib/adaptor/square_peg"
require_relative "../../lib/adaptor/square_peg_adaptor"

# 設計課題: クライアントが要求するインタフェースに合わせて Adaptee を振る舞わせたいが、 それが Adaptee 本来の責務ではない
class RoundHoleE2eTest < Minitest::Test
  def test_fits_round_peg
    # Arrange
    hole = RoundHole.new(radius: 5)
    round_peg = RoundPeg.new(radius: 5)

    # Assert
    assert hole.fits?(round_peg)
  end

  def test_not_fits_round_peg
    # Arrange
    hole = RoundHole.new(radius: 5)
    round_peg = RoundPeg.new(radius: 6)

    # Assert
    refute hole.fits?(round_peg)
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
    refute round_hole.fits?(square_peg_adaptor)
  end
end
