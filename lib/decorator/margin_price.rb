# frozen_string_literal: true

require_relative "price"

class MarginPrice
  include Price

  def initialize(price:)
    @price = price
  end
end
