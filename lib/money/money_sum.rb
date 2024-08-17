class MoneySum
  attr_reader :monies

  def initialize(monies:)
    @monies = monies
  end

  def +(other)
    other.add_money_sum(self)
  end

  def add_money(other)
    MoneySum.new(monies: self.monies.add(other))
  end

  def add_money_sum(other)
    MoneySum.new(monies: @monies.merge(other.dup.monies))
  end

  def ==(other)
    other.is_a?(MoneySum) && @monies == other.monies
  end
end

