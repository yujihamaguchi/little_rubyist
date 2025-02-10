# frozen_string_literal: true

require_relative "comparator"

class DictionaryOrderComparator
  include Comparator

  def comparison_lambda
    ->(word) { word }
  end
end
