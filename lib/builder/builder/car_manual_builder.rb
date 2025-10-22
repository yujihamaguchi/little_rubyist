# frozen_string_literal: true

require_relative "car_builder"
require_relative "../product/car_manual"
class CarManualBuilder < CarBuilder
  def build
    CarManual.new(engine: @engine, seats: @seats, roof_rails: @roof_rails)
  end
end
