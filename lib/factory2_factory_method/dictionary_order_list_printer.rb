# frozen_string_literal: true

require_relative "base_list_printer"

class DictionaryOrderListPrinter < BaseListPrinter
  def initialize(case_sensitive: true)
    super()
    @case_sensitive = case_sensitive
  end

  private

  def create_sort_key
    ->(attr) { @case_sensitive ? attr : attr.downcase }
  end
end
