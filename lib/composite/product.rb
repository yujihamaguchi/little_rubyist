# frozen_string_literal: true

class Product
  include Composite
  attr_reader :price

  def initialize(price:)
    @price = price
  end
end
