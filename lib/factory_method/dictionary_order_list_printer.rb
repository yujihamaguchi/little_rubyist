# frozen_string_literal: true

require_relative "list_printer"
require_relative "dictionary_order_comparator"

class DictionaryOrderListPrinter < ListPrinter
  def create_comparator
    DictionaryOrderComparator.new
  end
end
