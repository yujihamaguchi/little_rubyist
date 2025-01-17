# frozen_string_literal: true

require_relative "../../lib/strategy/duck"
require_relative "../../lib/strategy/fly_with_wings"

class DuckE2eTest < Minitest::Test
  def test_fly
    # Arrange
    duck = Duck.new(fly_behavior: FlyWithWings.new)

    # Act
    actual = duck.fly

    # Assert
    assert_equal "Flying with wings...", actual
  end
end
