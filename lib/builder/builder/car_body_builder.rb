# frozen_string_literal: true

require_relative "../product/car_body"
require_relative "car_builder"

class CarBodyBuilder < CarBuilder
  def build
    super
    car = CarBody.new
    car.engine = @engine_type
    car.seats = @seat_count
    car.roof_rails = @roof_rails_color
    car
  end
end
