# frozen_string_literal: true

require_relative "car_builder"
require_relative "../product/car_body"
class CarBodyBuilder < CarBuilder
  def build
    raise "engine is required" unless @engine

    car_body = CarBody.new
    car_body.engine = @engine
    car_body.seats = @seats
    car_body.roof_rails = @roof_rails

    car_body
  end
end
