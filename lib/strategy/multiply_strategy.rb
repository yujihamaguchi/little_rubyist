# frozen_string_literal: true

require_relative "binary_operation"
class MultiplyStrategy
  include BinaryOperation

  def calculate(n, m)
    n * m
  end
end
