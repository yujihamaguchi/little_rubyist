# frozen_string_literal: true

require "decorator/double_price"

class DoublePriceTest < Minitest::Test
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
