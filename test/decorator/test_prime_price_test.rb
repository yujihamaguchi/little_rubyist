# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../custom_mock'

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
