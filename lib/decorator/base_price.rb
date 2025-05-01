# frozen_string_literal: true

require_relative "price"

class BasePrice
  include Price

  def initialize(value:)
    @value = value
  end

  attr_reader :value
end
