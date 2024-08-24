# frozen_string_literal: true
# testValue
#
# | wholesalePrice primePrice doublePrice result |
#                                           "Arrange"
# primePrice := PrimePrice value: 3.
#   doublePrice := DoublePrice price: primePrice.
#   wholesalePrice := WholesalePrice price: doublePrice advantage: 7.
#   doublePrice := DoublePrice price: wholesalePrice.
#
# "Act"
# result := doublePrice value.
#
#   "Assert"
# self assert: result equals: 26
class MarginPriceE2eTest < MiniTest::Test
  def test_value
    # Arrange
    prime_price = PrimePrice.new(value: 3)
    double_price = DoublePrice.new(price: prime_price)
    wholesale_price = WholesalePrice(price: double_price, advantage: 7)
    double_price = DoublePrice.new(price: wholesale_price)

    # Act
    actual = double_price.value

    # Assert
    assert_equal 26, actual
  end
end
