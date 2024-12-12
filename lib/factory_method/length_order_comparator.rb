# frozen_string_literal: true

require_relative "comparator"

class LengthOrderComparator
  include Comparator

  def comparison_proc
    lambda(&:length)
  end
end
