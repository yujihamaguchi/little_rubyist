# frozen_string_literal: true

require_relative "comparator"

class DictionaryOrderComparator
  include Comparator

  def initialize(case_sensitive: false)
    @case_sensitive = case_sensitive
  end

  def comparison_lambda
    if @case_sensitive
      ->(word) { word }
    else
      ->(word) { word.downcase }
    end
  end
end
