class Money
  attr_reader :amount, :currency

  def initialize(amount:, currency:)
    @amount = amount
    @currency = currency
  end

  def +(other)
    if currency == other.currency
      Money.new(amount: @amount + other.amount, currency: @currency)
    else
      MoneySum.new(monies: Multiset.new([self, other]))
    end
  end

  def ==(other)
    @amount == other.amount && @currency == other.currency
  end
end
