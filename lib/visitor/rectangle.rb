# frozen_string_literal: true

require_relative "shape"

class Rectangle
  include Shape

  def accept(visitor:)
    visitor.visit_for_rectangle(self)
  end
end
