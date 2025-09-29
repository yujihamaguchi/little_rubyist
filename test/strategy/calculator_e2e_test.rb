# frozen_string_literal: true

require "minitest/autorun"
require_relative "../../lib/strategy/binary_calculator"
require_relative "../../lib/strategy/add_strategy"
# require_relative "../../lib/strategy/subtract_strategy"
# require_relative "../../lib/strategy/multiply_strategy"

# 共通の操作に対して複数の実装を使い分けたいが、条件分岐による実装の肥大化を避けたい。
class CalculatorE2eTest < Minitest::Test
  def test_add
    # Arrange
    calculator = BinaryCalculator.new(AddStrategy.new)

    # Act & Assert
    assert_equal 5, calculator.calculate(3, 2)
  end

  # def test_subtract
  #   # Arrange
  #   calculator = BinaryCalculator.new(SubtractStrategy.new)
  #
  #   # Act & Assert
  #   assert_equal 1, calculator.calculate(3, 2)
  # end
  #
  # def test_multiply
  #   # Arrange
  #   calculator = BinaryCalculator.new(MultiplyStrategy.new)
  #
  #   # Act & Assert
  #   assert_equal 6, calculator.calculate(3, 2)
  # end
end
