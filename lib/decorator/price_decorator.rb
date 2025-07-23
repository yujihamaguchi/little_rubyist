# frozen_string_literal: true

require_relative "price"
class PriceDecorator
  include Price
  def initialize(price:)
    @price = price
  end
end
