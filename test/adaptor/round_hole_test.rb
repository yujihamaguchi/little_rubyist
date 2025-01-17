# frozen_string_literal: true

require_relative "../test_helper"

require_relative "../../lib/adaptor/round_hole"

class RoundHoleTest < Minitest::Test
  def test_fits_round_peg
    # Arrange
    radius = 5
    round_hole = RoundHole.new(radius: radius)
    round_peg = CustomMock.new
    round_peg.expect :radius, radius

    # Act
    round_hole.fits?(round_peg)

    # Assert
    round_peg.verify
  end

  def test_fits_square_peg; end
end
