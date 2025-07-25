# frozen_string_literal: true

require_relative "list_printer"
class LengthOrderListPrinter
  include ListPrinter

  def initialize(reverse: false)
    @reverse = reverse
  end

  def key_selector
    ->(elm) { @reverse ? -elm.length : elm.length }
  end
end
