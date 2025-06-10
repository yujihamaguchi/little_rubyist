# frozen_string_literal: true

require_relative "../../lib/decorator/price"
require_relative "../../lib/decorator/base_price"
require_relative "../../lib/decorator/doubled_price"
require_relative "../../lib/decorator/wholesale_price"

# あるクラスの機能拡張を行いたいが、クラスの責務が肥大化するのを防ぎたい。また「継承によるサブクラス乱立（クラス爆発）」も回避したい
class PriceE2eTest < Minitest::Test
  def test_base_price_value
    # Arrange
    base_price = BasePrice.new(value: 3)

    # Act
    result = base_price.value

    # Assert
    assert_equal 3, result
  end

  def test_doubled_price_value
    # Arrange
    base_price = BasePrice.new(value: 3)
    doubled_price = DoubledPrice.new(price: base_price)

    # Act
    result = doubled_price.value

    # Assert
    assert_equal 6, result
  end

  def test_wholesale_price_value
    # Arrange
    base_price = BasePrice.new(value: 5)
    wholesale_price = WholesalePrice.new(price: base_price, advantage: 2)

    # Act
    result = wholesale_price.value

    # Assert
    assert_equal 3, result
  end

  def test_price_chain_value
    # Arrange
    base_price = BasePrice.new(value: 3)
    doubled_price = DoubledPrice.new(price: base_price)
    wholesale_price = WholesalePrice.new(price: doubled_price, advantage: 2)
    second_doubled_price = DoubledPrice.new(price: wholesale_price)

    # Act
    result = second_doubled_price.value

    # Assert
    assert_equal 8, result
  end
end
