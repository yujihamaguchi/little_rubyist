# frozen_string_literal: true

class MarginPrice
  include Price

  def initialize(price:)
    @price = price
  end
end
