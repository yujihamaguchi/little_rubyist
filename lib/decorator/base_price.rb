# frozen_string_literal: true

require_relative "price"
class BasePrice
  include Price
  attr_reader :value

  def initialize(value:)
    @value = value
  end
end
