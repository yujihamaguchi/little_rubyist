# frozen_string_literal: true

require_relative "../test_helper"

require_relative "../../lib/adapter/round_peg"
require_relative "../../lib/adapter/round_hole"
require_relative "../../lib/adapter/square_peg"
require_relative "../../lib/adapter/square_peg_to_round_hole_adapter"

# クライアントが要求する抽象（概念・インタフェース）に合わせて、既存のクラス（ Adaptee ）を振る舞わせたいが、その責務は本来 Adaptee が担うべきものではない。
class RoundHoleE2eTest < Minitest::Test
  def test_fits_round_peg
    (1..5).each do |peg_radius|
      # Arrange
      hole = RoundHole.new(radius: 5)
      round_peg = RoundPeg.new(radius: peg_radius)

      # Act & Assert
      assert hole.fits?(peg: round_peg)
    end
  end

  def test_not_fits_round_peg
    # Arrange
    hole = RoundHole.new(radius: 5)
    round_peg = RoundPeg.new(radius: 6)

    # Act & Assert
    refute hole.fits?(peg: round_peg)
  end

  def test_fits_square_peg
    (1..5).each do |n|
      # Arrange
      hole = RoundHole.new(radius: 5)
      square_peg_width = n * Math.sqrt(2)
      square_peg = SquarePeg.new(width: square_peg_width)
      square_peg_adapter = SquarePegToRoundHoleAdapter.new(adaptee: square_peg)

      # Act & Assert
      assert hole.fits?(peg: square_peg_adapter)
    end
  end

  def test_not_fits_square_peg
    # Arrange
    hole = RoundHole.new(radius: 5)
    square_peg = SquarePeg.new(width: 5 * Math.sqrt(2) + 1)
    square_peg_adapter = SquarePegToRoundHoleAdapter.new(adaptee: square_peg)

    # Act & Assert
    refute hole.fits?(peg: square_peg_adapter)
  end
end
