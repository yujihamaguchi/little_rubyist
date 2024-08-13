# frozen_string_literal: true

class Money
  attr_reader :amount, :currency

  def initialize(amount:, currency:)
    @amount = amount
    @currency = currency
  end

  def +(another_money)
    self.class.new(amount: @amount + another_money.amount, currency: @currency)
  end

  def ==(another_money)
    @amount == another_money.amount && @currency == another_money.currency
  end
end
