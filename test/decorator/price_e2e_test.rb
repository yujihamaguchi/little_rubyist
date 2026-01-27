# frozen_string_literal: true

require_relative "../test_helper"
require_relative "../../lib/decorator/base_price"
require_relative "../../lib/decorator/doubled_price"
require_relative "../../lib/decorator/discounted_price"

# あるクラスの機能拡張を行いたいが、クラスの責務が肥大化するのを防ぎたい。また、継承によるサブクラス乱立（クラス爆発）も回避したい。
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

  def test_discounted_price_value
    # Arrange
    base_price = BasePrice.new(value: 5)
    discounted_price = DiscountedPrice.new(price: base_price, discount: 2)

    # Act
    result = discounted_price.value

    # Assert
    assert_equal 3, result
  end

  def test_doubled_then_discounted_price_value
    # Arrange
    base_price = BasePrice.new(value: 3)
    doubled_price = DoubledPrice.new(price: base_price)
    doubled_and_discounted_price = DiscountedPrice.new(price: doubled_price, discount: 2)

    # Act
    result = doubled_and_discounted_price.value

    # Assert
    assert_equal 4, result
  end

  def test_discounted_then_doubled_price_value
    # Arrange
    base_price = BasePrice.new(value: 3)
    discounted_price = DiscountedPrice.new(price: base_price, discount: 2)
    discounted_and_doubled_price = DoubledPrice.new(price: discounted_price)

    # Act
    result = discounted_and_doubled_price.value

    # Assert
    assert_equal 2, result
  end
end
