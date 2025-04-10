# frozen_string_literal: true
require_relative "list_printer"
class DictionaryOrderListPrinter < ListPrinter
  def initialize(case_sensitive: true)
    @case_sensitive = case_sensitive
  end

  def create_key_extractor
    if @case_sensitive
      ->(x) { x }
    else
      ->(x) { x.downcase }
    end
  end
end
