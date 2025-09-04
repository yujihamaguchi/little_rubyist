# frozen_string_literal: true

require_relative "csv_list_printer"
class DictionaryOrderCSVListPrinter
  include CSVListPrinter
  def initialize(case_sensitive: true)
    @case_sensitive = case_sensitive
  end

  def sort_key
    ->(word) { @case_sensitive ? word : word.downcase }
  end
end
