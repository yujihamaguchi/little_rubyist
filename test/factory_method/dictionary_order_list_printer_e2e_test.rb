# frozen_string_literal: true

require_relative "../test_helper"
require "factory_method/dictionary_order_list_printer"

class DictionaryOrderListPrinterE2eTest < Minitest::Test
  def test_print_list
    # Arrange
    list_printer = DictionaryOrderListPrinter.new

    # Act
    actual = list_printer.print_list(%w[banana cake apple])

    # Assert
    assert_equal "[\"apple\", \"banana\", \"cake\"]",
                 actual
  end
end
