# frozen_string_literal: true

class BinaryCalculator
  def initialize(strategy)
    @strategy = strategy
  end

  def calculate(value1, value2)
    @strategy.calculate(value1, value2)
  end
end
