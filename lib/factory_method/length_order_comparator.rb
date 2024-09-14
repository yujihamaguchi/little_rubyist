# frozen_string_literal: true

class LengthOrderComparator
  def comparison_proc
    lambda(&:length)
  end
end
