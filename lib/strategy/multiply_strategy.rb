# frozen_string_literal: true

require_relative "binary_operation_strategy"
class MultiplyStrategy
  include BinaryOperationStrategy

  def calculate(num1, num2)
    num1 * num2
  end
end
