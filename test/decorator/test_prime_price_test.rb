# frozen_string_literal: true

require "decorator/prime_price"

class TestPrimePriceTest < Minitest::Test
  def test_value
    # Arrange
    expected = 20
    prime_price = PrimePrice.new(value: expected)

    # Act
    actual = prime_price.value

    # Assert
    assert_equal expected, actual
  end
end
