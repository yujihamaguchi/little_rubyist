# frozen_string_literal: true

require_relative "comparator"

class DictionaryOrderComparator
  include Comparator

  def comparison_proc
    ->(word) { word }
  end
end
