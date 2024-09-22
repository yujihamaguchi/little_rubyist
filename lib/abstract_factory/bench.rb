# frozen_string_literal: true

require_relative "furniture"

class Bench < Furniture
  def lie
    "Lie on the #{self.style} bench."
  end
end
