require 'minitest/autorun'
require_relative '../lib/money'

class MoneyTest < Minitest::Test
  def test_plus_money
    # Arrange
    money1 = Money.new(amount: 1, currency: :USD)
    money2 = Money.new(amount: 2, currency: :USD)
    expected = Money.new(amount: 3, currency: :USD)

    # Act
    actual = money1 + money2

    # Assert
    assert_equal expected, actual
  end
end