# frozen_string_literal: true

class DictionaryOrderComparator
  def comparison_proc
    ->(word) { word }
  end
end
