# frozen_string_literal: true
require_relative "../product/car_body"
require_relative "car_builder"

class CarBodyBuilder < CarBuilder
  def initialize
    @product = CarBody.new
    super
  end
end
