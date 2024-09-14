# frozen_string_literal: true

require "strategy/duck"

class DuckTest < Minitest::Test
  def test_fly
    # Arrange
    fly_behavior = Minitest::Mock.new
    fly_behavior.expect :fly, nil
    duck = Duck.new(fly_behavior: fly_behavior)

    # Act
    duck.fly

    # Assert
    fly_behavior.verify
  end
end
