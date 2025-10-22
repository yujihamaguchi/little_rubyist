# frozen_string_literal: true

require_relative "./car_builder"
require_relative "../product/car_body"
class CarBodyBuilder < CarBuilder
  def build
    raise "engine is required" if @engine.nil?

    CarBody.new(engine: @engine, seats: @seats, roof_rails: @roof_rails)
  end
end
