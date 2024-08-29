# frozen_string_literal: true

require_relative "margin_price"

class DoublePrice < MarginPrice
  def value
    @price.value * 2
  end
end
