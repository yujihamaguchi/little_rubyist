# frozen_string_literal: true

require_relative "../../lib/decorator/wholesale_price"

class WholesalePriceTest < Minitest::Test
  def test_value
    # Arrange
    original_value = 10
    advantage = 3
    expected = original_value + advantage
    price = CustomMock.new
    price.expect :value, original_value
    wholesale_price = WholesalePrice.new(price: price, advantage: advantage)

    # Act
    actual = wholesale_price.value

    # Assert
    price.verify
    assert_equal expected, actual
  end
end
