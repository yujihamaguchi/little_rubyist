# frozen_string_literal: true

require_relative "list_printer"
class DictionaryOrderListPrinter < ListPrinter
  def initialize(case_sensitive: true)
    super()
    @case_sensitive = case_sensitive
  end

  def rule
    ->(str) { @case_sensitive ? str : str.downcase }
  end
end
