# frozen_string_literal: true

require_relative "furniture"

class Chair < Furniture
  def sit
    "Sit on the #{self.style} chair."
  end
end
