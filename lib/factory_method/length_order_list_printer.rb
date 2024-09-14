# frozen_string_literal: true

require_relative "list_printer"
require_relative "length_order_comparator"

class LengthOrderListPrinter < ListPrinter
  def create_comparator
    LengthOrderComparator.new
  end
end
