# frozen_string_literal: true

require_relative "comparator"

class LengthOrderComparator
  include Comparator

  def comparison_lambda
    lambda(&:length)
  end
end
