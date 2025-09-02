# frozen_string_literal: true

require_relative "price"
class DiscountedPrice
  include Price
  def initialize(price:, discount:)
    @price = price
    @discount = discount
  end

  def value
    @price.value - @discount
  end
end
