# frozen_string_literal: true

require_relative "price"
class Product
  include Price
  attr_reader :price

  def initialize(price:)
    @price = price
  end
end
