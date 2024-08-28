# frozen_string_literal: true
require_relative "margin_price"

class WholesalePrice < MarginPrice

  def initialize(price:, advantage:)
    @price = price
    @advantage = advantage
  end

  def value
    @price.value + @advantage
  end
end
