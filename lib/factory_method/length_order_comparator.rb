# frozen_string_literal: true

require_relative "comparator"

class LengthOrderComparator
  include Comparator

  def initialize(reverse: false)
    @reverse = reverse
  end

  def comparison_lambda
    if @reverse
      ->(word) { -word.length }
    else
      ->(word) { word.length }
    end
  end
end
