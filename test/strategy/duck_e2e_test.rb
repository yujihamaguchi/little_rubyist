# frozen_string_literal: true

require_relative "../../lib/strategy/duck"
require_relative "../../lib/strategy/fly_with_wings"

# 共通の操作に対して複数の実装が存在し、条件分岐による実装の肥大化を避けたい。
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
