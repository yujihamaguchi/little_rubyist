# frozen_string_literal: true

require_relative "../../lib/decorator/prime_price"
require_relative "../../lib/decorator/doubled_price"
require_relative "../../lib/decorator/wholesale_price"

# あるクラスの機能拡張を行いたいが、クラスの責務が肥大化するのを防ぎたい。また「継承によるサブクラス乱立（クラス爆発）」も回避したい
class MarginPriceE2eTest < Minitest::Test
  def test_value
    # Arrange
    prime_price = PrimePrice.new(value: 3)
    assert_equal 3, prime_price.value
    doubled_price = DoubledPrice.new(price: prime_price)
    assert_equal 6, doubled_price.value
    wholesale_price = WholesalePrice.new(price: doubled_price, advantage: 2)
    assert_equal 4, wholesale_price.value
    doubled_price = DoubledPrice.new(price: wholesale_price)

    # Act & Assert
    assert_equal 8, doubled_price.value
  end
end
