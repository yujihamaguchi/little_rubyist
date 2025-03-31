# frozen_string_literal: true

require_relative "../test_helper"

class WholeSalePriceTest < Minitest::Test
  TEST_CASES = [
    { value: 1, advantage: 1, expected: 0 },
    { value: 2, advantage: 1, expected: 1 },
    { value: 5, advantage: 3, expected: 2 }
  ].freeze

  def test_value
    TEST_CASES.each do |test_case|
      # Arrange
      some_price = CustomMock.new
      some_price.expect :value, test_case[:value]
      whole_sale_price = WholesalePrice.new(price: some_price, advantage: test_case[:advantage])

      # Act
      actual = whole_sale_price.value

      # Assert
      assert_equal test_case[:expected], actual
    end
  end
end
