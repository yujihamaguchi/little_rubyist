# frozen_string_literal: true

class BinaryCalculator
  def initialize(strategy)
    @strategy = strategy
  end

  def calculate(n, m)
    @strategy.execute(n, m)
  end
end
