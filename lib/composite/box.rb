# frozen_string_literal: true
require_relative "component"

class Box
  include Component

  def initialize
    @components = []
  end

  def add(component)
    @components.push(component)
  end

  def price
    @components.sum(&:price)
  end
end
