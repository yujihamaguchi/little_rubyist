# frozen_string_literal: true

require_relative "binary_operation_strategy"
class MultiplyStrategy
  include BinaryOperationStrategy

  def execute(number1, number2)
    number1 * number2
  end
end
