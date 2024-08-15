# frozen_string_literal: true

class MoneySum
  attr_reader :monies

  def initialize(monies:)
    @monies = monies
  end

  def +(other)
    other.add(money_sum: self)
  end

  def add(money: other)
    MoneySum.new(monies: @monies.add(other))
  end
end

def add(money_sum: other)
  MoneySum.new(monies: @monies.merge(other.monies))
end

def ==(other)
  @monies == other.monies
end
