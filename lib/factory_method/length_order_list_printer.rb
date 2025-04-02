# frozen_string_literal: true
require_relative "list_printer"

class LengthOrderListPrinter < ListPrinter
  def initialize(reverse: false)
    @reverse = reverse
  end

  def create_key_extractor
    if @reverse
      ->(x) { -x.length }
    else
      ->(x) { x.length }
    end
  end
end
