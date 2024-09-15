# frozen_string_literal: true

require_relative "../test_helper"
require "factory_method/list_printer"

class ListPrinterTest < Minitest::Test
  def test_print_list
    # Arrange
    list_printer = ListPrinter.new

    comparator = CustomMock.new
    comparison_proc = proc {}
    comparator.expect :comparison_proc, comparison_proc

    list = CustomMock.new
    sorted_list = CustomMock.new
    list.expect(:sort_by, sorted_list) { |&_comparison_proc| _comparison_proc }

    sorted_list_string = CustomMock.new
    sorted_list.expect :to_s, sorted_list_string

    # Act
    actual = nil
    list_printer.stub(:create_comparator, comparator) do
      actual = list_printer.print_list(list)
    end

    # Assert
    assert_equal sorted_list_string, actual
    comparator.verify
    list.verify
    sorted_list.verify
  end
end
