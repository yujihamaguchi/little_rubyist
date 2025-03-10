# frozen_string_literal: true
require_relative 'car'

class CarBuilder
  def initialize
    @product = Car.new
  end

  def product
    @product
  end

  def with_engine(type:) end

end
