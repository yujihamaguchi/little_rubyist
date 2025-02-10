# frozen_string_literal: true

require_relative "list_printer"
require_relative "length_order_comparator"

class LengthOrderListPrinter < ListPrinter
  def initialize(reverse: false)
    super()
    @reverse = reverse
  end

  def create_comparator
    LengthOrderComparator.new(reverse: @reverse)
  end
end
