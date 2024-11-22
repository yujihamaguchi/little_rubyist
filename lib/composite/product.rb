# frozen_string_literal: true

require_relative "component"

class CarProduct
  include Component

  attr_reader :price

  def initialize(price:)
    @price = price
  end
end
