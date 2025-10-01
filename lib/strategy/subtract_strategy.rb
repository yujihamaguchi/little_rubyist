# frozen_string_literal: true

require_relative "binary_operation"
class SubtractStrategy
  include BinaryOperation
  def calculate(value1, value2)
    value1 - value2
  end
end
