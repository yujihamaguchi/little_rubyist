# frozen_string_literal: true

class BinaryCalculator
  def initialize(strategy)
    @strategy = strategy
  end

  def calculate(num1, num2)
    @strategy.calculate(num1, num2)
  end
end
