# frozen_string_literal: true

require_relative "component"

class Box
  include Component

  def initialize
    @children = []
  end

  def add(child)
    @children.push(child)
  end

  def price
    @children.sum(&:price)
  end
end
