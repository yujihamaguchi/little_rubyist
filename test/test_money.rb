require "minitest/autorun"
require "multiset"
require_relative "../lib/money"
require_relative "../lib/money_sum"

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

  def test_plus_money_with_different_currency
    # Arrange
    usd = Money.new(amount: 1, currency: :USD)
    gbp = Money.new(amount: 2, currency: :GBP)
    expected = MoneySum.new(monies: Multiset.new([usd, gbp]))

    # Action
    actual = usd + gbp

    # Assert
    assert_equal expected, actual
  end
end