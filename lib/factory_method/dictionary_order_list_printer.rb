# frozen_string_literal: true

require_relative "list_printer"

class DictionaryOrderListPrinter < ListPrinter
  def create_comparator
    ->(word) { word }
  end
end
