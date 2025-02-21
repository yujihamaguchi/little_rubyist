# frozen_string_literal: true

require_relative "../../lib/decorator/prime_price"
require_relative "../../lib/decorator/double_price"
require_relative "../../lib/decorator/wholesale_price"

# あるクラスの機能拡張を行いたいが、クラスの責務が肥大化するのを防ぎたい、同時に、「継承によるサブクラス乱立（クラス爆発）」も回避したい
class MarginPriceE2eTest < Minitest::Test
  def test_value
    # Arrange
    prime_price = PrimePrice.new(value: 3)
    double_price = DoublePrice.new(price: prime_price)
    wholesale_price = WholesalePrice.new(price: double_price, advantage: 2)
    double_price = DoublePrice.new(price: wholesale_price)

    # Act & Assert
    assert_equal 8, double_price.value
  end
end
