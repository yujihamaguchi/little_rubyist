# frozen_string_literal: true

require_relative "csv_list_printer"
class LengthOrderCSVListPrinter
  include CSVListPrinter
  def initialize(reverse: false)
    @reverse = reverse
  end

  def sort_key
    ->(word) { @reverse ? -word.length : word.length }
  end
end
