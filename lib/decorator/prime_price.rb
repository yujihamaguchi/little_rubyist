# frozen_string_literal: true
require_relative "price"

class PrimePrice
  include Price

  attr_reader :value

  def initialize(value:)
    @value = value
  end
end
