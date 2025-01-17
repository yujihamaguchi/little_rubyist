# frozen_string_literal: true

require_relative "../test_helper"
require_relative "../../lib/factory_method/length_order_list_printer"

class LengthOrderListPrinterE2eTest < Minitest::Test
  def test_print_list
    # Arrange
    list_printer = LengthOrderListPrinter.new

    # Act
    actual = list_printer.print_list(%w[banana cake apple])

    # Assert
    assert_equal "[\"cake\", \"apple\", \"banana\"]",
                 actual
  end
end
