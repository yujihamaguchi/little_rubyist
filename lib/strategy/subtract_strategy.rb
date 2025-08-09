# frozen_string_literal: true

require_relative "binary_operation_strategy"
class SubtractStrategy
  include BinaryOperationStrategy

  def calculate(num1, num2)
    num1 - num2
  end
end
