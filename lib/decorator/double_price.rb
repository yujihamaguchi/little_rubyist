# frozen_string_literal: true
require_relative "price"

class DoublePrice
  include Price

  def initialize(price:)
    @price = price
  end

  def value
    @price.value * 2
  end
end
