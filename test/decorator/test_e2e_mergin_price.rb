# frozen_string_literal: true
require "minitest/autorun"

require_relative "../../lib/decorator/prime_price"
require_relative "../../lib/decorator/double_price"
require_relative "../../lib/decorator/wholesale_price"

class TestE2eMarginPrice < Minitest::Test
  def test_value
    # Arrange
    prime_price = PrimePrice.new(value: 3)
    double_price = DoublePrice.new(price: prime_price)
    wholesale_price = WholesalePrice.new(price: double_price, advantage: 7)
    double_price = DoublePrice.new(price: wholesale_price)

    # Act
    actual = double_price.value

    # Assert
    assert_equal 26, actual
  end
end