# frozen_string_literal: true

require_relative "price_decorator"

class DoublePrice < PriceDecorator
  def value
    @price.value * 2
  end
end
