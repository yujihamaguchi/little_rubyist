# frozen_string_literal: true

require_relative "list_printer"

class LengthOrderListPrinter < ListPrinter
  def create_comparator
    lambda(&:length)
  end
end
