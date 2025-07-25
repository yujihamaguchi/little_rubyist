# frozen_string_literal: true

require_relative "list_printer"
class DictionaryOrderListPrinter
  include ListPrinter
  def initialize(case_sensitive: true)
    @case_sensitive = case_sensitive
  end

  def key_selector
    ->(elm) { @case_sensitive ? elm : elm.downcase }
  end
end
