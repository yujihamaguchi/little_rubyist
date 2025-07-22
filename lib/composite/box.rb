# frozen_string_literal: true

require_relative "price"
class Box
  include Price
  def initialize
    @children = []
  end

  def add(child)
    @children << child
  end

  def price
    @children.sum(&:price)
  end
end
