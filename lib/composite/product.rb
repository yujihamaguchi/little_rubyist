# frozen_string_literal: true
require_relative "component"

class Product
  include Component
  attr_reader :price

  def initialize(price:)
    @price = price
  end
end
