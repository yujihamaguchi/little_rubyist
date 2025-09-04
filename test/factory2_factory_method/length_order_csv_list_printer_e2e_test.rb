# frozen_string_literal: true

require_relative "../test_helper"
require_relative "../../lib/factory2_factory_method/length_order_csv_list_printer"

class LengthOrderCSVListPrinterE2eTest < Minitest::Test
  def test_string_from
    # Arrange
    csv_list_printer = LengthOrderCSVListPrinter.new

    # Act
    actual = csv_list_printer.string_from(%w[banana cake apple])

    # Assert
    assert_equal "cake,apple,banana", actual
  end

  def test_string_from_reverse
    # Arrange
    csv_list_printer = LengthOrderCSVListPrinter.new(reverse: true)

    # Act
    actual = csv_list_printer.string_from(%w[banana cake apple])

    # Assert
    assert_equal "banana,apple,cake", actual
  end
end
