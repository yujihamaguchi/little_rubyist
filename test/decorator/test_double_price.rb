# frozen_string_literal: true

require "minitest/autorun"
require_relative "../custom_mock"

class TestDoublePrice < Minitest::Test
  def test_value
    # Arrange
    original_value = 3
    expected = original_value * 2
    price = CustomMock.new
    price.expect :value, original_value
    double_price = DoublePrice.new(price: price)

    # Act
    actual = double_price.value

    # Assert
    assert_equal expected, actual
  end
end