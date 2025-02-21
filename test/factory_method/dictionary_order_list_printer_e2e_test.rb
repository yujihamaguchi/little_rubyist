# frozen_string_literal: true

require_relative "../test_helper"
require_relative "../../lib/factory_method/dictionary_order_list_printer"

# プログラムの特定の部分のロジックを差し替えたいが、クライアントは詳細を知らなくてよいようにしたい
class DictionaryOrderListPrinterE2eTest < Minitest::Test
  def test_print_list
    # Arrange
    list_printer = DictionaryOrderListPrinter.new

    # Act
    actual = list_printer.print_list(%w[banana Cake apple])

    # Assert
    assert_equal "[\"apple\", \"banana\", \"Cake\"]",
                 actual
  end

  def test_print_list_with_mixed_case
    # Arrange
    list_printer = DictionaryOrderListPrinter.new(case_sensitive: true)

    # Act
    actual = list_printer.print_list(%w[banana Cake apple])

    # Assert
    assert_equal "[\"Cake\", \"apple\", \"banana\"]", actual
  end
end
