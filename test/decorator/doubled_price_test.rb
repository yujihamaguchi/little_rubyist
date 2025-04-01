# frozen_string_literal: true

require_relative "../test_helper"

class DoubledPriceTest < Minitest::Test
  TEST_CASES = [
    { value: 0, expected: 0 },
    { value: 1, expected: 2 },
    { value: 2, expected: 4 },
    { value: 3, expected: 6 }
  ].freeze

  def test_value
    TEST_CASES.each do |test_case|
      # Arrange
      some_price = CustomMock.new
      some_price.expect :value, test_case[:value]
      doubled_price = DoubledPrice.new(price: some_price)
      # Act
      actual = doubled_price.value

      # Assert
      assert_equal test_case[:expected], actual
    end
  end
end
