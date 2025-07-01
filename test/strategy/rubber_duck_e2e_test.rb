# frozen_string_literal: true

require_relative "../../lib/strategy/rubber_duck"
require_relative "../../lib/strategy/fly_no_way"
require_relative "../../lib/strategy/fly_with_propeller"

class RubberDuckE2eTest < Minitest::Test
  def test_fly_no_way
    # Arrange
    rubber_duck = RubberDuck.new(fly_behavior: FlyNoWay.new)

    # Act
    actual = rubber_duck.fly

    # Assert
    assert_equal "No way!", actual
  end

  def test_fly_with_propeller
    # Arrange
    rubber_duck = RubberDuck.new(fly_behavior: FlyWithPropeller.new)

    # Act
    actual = rubber_duck.fly

    # Assert
    assert_equal "Flying with propeller...", actual
  end
end
