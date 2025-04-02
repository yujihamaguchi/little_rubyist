# frozen_string_literal: true

require_relative "../test_helper"
require_relative "../../lib/factory_method/dictionary_order_list_printer"

# 処理の一部のロジックを差し替えたいが、クライアントはその詳細を知らなくてよいようにしたい
class DictionaryOrderListPrinterE2eTest < Minitest::Test
  def test_string_from
    # Arrange
    list_printer = DictionaryOrderListPrinter.new

    # Act
    actual = list_printer.string_from(%w[banana cake apple])

    # Assert
    assert_equal "[\"apple\", \"banana\", \"cake\"]",
                 actual
  end

  def test_string_from_with_mixed_case
    # Arrange
    list_printer = DictionaryOrderListPrinter.new(case_sensitive: false)

    # Act
    actual = list_printer.string_from(%w[banana Cake apple])

    # Assert
    assert_equal "[\"apple\", \"banana\", \"Cake\"]", actual
  end
end
