# frozen_string_literal: true

class DoublePrice
  def initialize(price:)
    @price = price
  end
  def value
    @price.value * 2
  end
end
