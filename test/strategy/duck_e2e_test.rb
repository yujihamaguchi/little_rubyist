# frozen_string_literal: true

require_relative "../../lib/strategy/duck"
require_relative "../../lib/strategy/fly_with_wings"

# 同じインターフェースを使う操作があるが、内部の実装（アルゴリズムや振る舞い）は複数通り存在し、条件分岐による複雑化を避けたい。
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
