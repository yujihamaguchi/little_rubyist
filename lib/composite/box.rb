# frozen_string_literal: true

require_relative "price"
class Box
  include Price
  def initialize
    @components = []
  end

  def add(component)
    @components << component
    self
  end

  def price
    @components.sum(&:price)
  end
end
