class Money
  attr_reader :amount, :currency

  def initialize(amount:, currency:)
    @amount = amount
    @currency = currency
  end

  def +(other)
    self.class.new(amount: @amount + other.amount, currency: @currency)
  end

  def ==(other)
    @amount == other.amount && @currency == other.currency
  end
end
