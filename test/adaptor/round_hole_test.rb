# frozen_string_literal: true

require "minitest/autorun"
require_relative "../test_helper"
require_relative "../../lib/adaptor/round_hole"

class RoundHoleTest < Minitest::Test
  def test_fits_peg
    # Arrange
    round_hole = RoundHole.new(radius: Object)
    peg = CustomMock.new
    peg.expect :radius, Object

    # Act
    round_hole.fits?(peg)

    # Assert
    peg.verify
  end
end
