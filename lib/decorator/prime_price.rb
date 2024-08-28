# frozen_string_literal: true
require_relative "price"

class PrimePrice
  include Price

  def initialize(value:)
    @value = value
  end

  def value
    @value
  end
end
