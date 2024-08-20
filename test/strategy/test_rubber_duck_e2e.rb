# frozen_string_literal: true

require "minitest/autorun"
require_relative "../../lib/strategy/rubber_duck"
require_relative "../../lib/strategy/fly_no_way"

class RubberDuckE2eTest < Minitest::Test
  def test_fly
    # Arrange
    rubber_duck = RubberDuck.new(fly_behavior: FlyNoWay.new)

    # Act
    actual = rubber_duck.fly

    # Assert
    assert_equal "No way!", actual
  end
end
