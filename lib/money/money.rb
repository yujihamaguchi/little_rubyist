# frozen_string_literal: true

class Money
  attr_reader :amount, :currency

  def initialize(amount:, currency:)
    @amount = amount
    @currency = currency
  end

  def +(other)
    other.add_money(self)
  end

  def add_money(other)
    if currency == other.currency
      self.class.new(amount: @amount + other.amount, currency: @currency)
    else
      MoneySum.new(monies: Multiset.new([self, other]))
    end
  end

  def add_money_sum(other)
    other.add_money(self)
  end

  def ==(other)
    @amount == other.amount && @currency == other.currency
  end
end
