# frozen_string_literal: true

require_relative "shape"

class Dot
  include Shape

  def accept(visitor:)
    visitor.visit_for_dot(self)
  end
end
