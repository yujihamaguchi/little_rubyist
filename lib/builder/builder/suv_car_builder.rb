# frozen_string_literal: true
require_relative "car_builder"

class SUVCarBuilder < CarBuilder
  def with_roof_rails(color:)
    @color = color
    self
  end
end
