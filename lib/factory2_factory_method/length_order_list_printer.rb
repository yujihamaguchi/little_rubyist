# frozen_string_literal: true

require_relative "list_printer"
class LengthOrderListPrinter < ListPrinter
  def initialize(reverse: false)
    super()
    @reverse = reverse
  end

  def rule
    ->(str) { @reverse ? -str.length : str.length }
  end
end
