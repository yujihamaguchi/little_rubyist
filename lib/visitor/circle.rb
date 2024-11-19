# frozen_string_literal: true

require_relative "shape"

class Circle
  include Shape

  def accept(visitor:)
    visitor.visit_for_circle(self)
  end
end
