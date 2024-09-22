# frozen_string_literal: true

require_relative "furniture"

class Table < Furniture
  def stand
    "Stand on the #{self.style} table."
  end
end
