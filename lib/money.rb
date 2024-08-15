class Money
  attr_reader :amount, :currency

  def initialize(amount:, currency:)
    @amount = amount
    @currency = currency
  end

  def +(other)
    other.add(money: self)
  end

  def add(money: other)
    if currency == other.currency
      Money.new(amount: @amount + other.amount, currency: @currency)
    else
      MoneySum.new(monies: Multiset.new([self, other]))
    end
  end

  def add(money_sum: other)
    MoneySum.new(monies: other.monies.add(self))
  end

  def ==(other)
    puts(other)
    @amount == other.amount && @currency == other.currency
  end
end
