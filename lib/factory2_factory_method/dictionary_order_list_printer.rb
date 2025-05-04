# frozen_string_literal: true

require_relative "list_printer"

class DictionaryOrderListPrinter
  include ListPrinter

  def initialize(case_sensitive: true)
    @case_sensitive = case_sensitive
  end

  def sort_key
    ->(attr) { @case_sensitive ? attr : attr.downcase }
  end
end
