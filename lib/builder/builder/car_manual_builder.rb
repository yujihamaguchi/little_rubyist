# frozen_string_literal: true
require_relative "../product/car_manual"
require_relative "car_builder"

class CarManualBuilder < CarBuilder
  def initialize
    @product = CarManual.new
    super
  end
end
