# frozen_string_literal: true

require_relative "price"
class WholesalePrice
  include Price
  def initialize(price:, advantage:)
    @price = price
    @advantage = advantage
  end

  def value
    @price.value - @advantage
  end
end
