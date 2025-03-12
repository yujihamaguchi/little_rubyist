# frozen_string_literal: true
require_relative "car"
require_relative "car_builder"

class CarBodyBuilder < CarBuilder
  def initialize
    @product = Car.new
    super
  end

end
