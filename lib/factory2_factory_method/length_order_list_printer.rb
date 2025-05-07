# frozen_string_literal: true

require_relative "base_list_printer"

class LengthOrderListPrinter < BaseListPrinter
  def initialize(reverse: false)
    super()
    @reverse = reverse
  end

  private

  def create_sort_key
    ->(attr) { @reverse ? -attr.length : attr.length }
  end
end
