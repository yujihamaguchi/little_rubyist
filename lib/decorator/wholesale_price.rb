# frozen_string_literal: true

require_relative "price_decorator"
class WholesalePrice < PriceDecorator
  def initialize(price:, advantage:)
    super(price: price)
    @advantage = advantage
  end

  def value
    @price.value - @advantage
  end
end
