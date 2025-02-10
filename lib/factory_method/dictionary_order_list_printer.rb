# frozen_string_literal: true

require_relative "list_printer"
require_relative "dictionary_order_comparator"

class DictionaryOrderListPrinter < ListPrinter
  def initialize(case_sensitive: false)
    super()
    @case_sensitive = case_sensitive
  end

  def create_comparator
    DictionaryOrderComparator.new(case_sensitive: @case_sensitive)
  end
end
