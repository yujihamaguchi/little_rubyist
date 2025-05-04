# frozen_string_literal: true

require_relative "list_printer"

class LengthOrderListPrinter
  include ListPrinter

  def initialize(reverse: false)
    @reverse = reverse
  end

  def sort_key
    ->(attr) { @reverse ? -attr.length : attr.length }
  end
end
