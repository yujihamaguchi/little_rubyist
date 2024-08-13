# frozen_string_literal: true

class MoneySum
  attr_reader :monies

  def initialize(monies:)
    @monies = monies
  end

  def ==(other)
    @monies == other.monies
  end
end
