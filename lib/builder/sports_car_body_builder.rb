# frozen_string_literal: true

require_relative "sports_car_body"
require_relative "sports_car_builder"

class SportsCarBodyBuilder < SportsCarBuilder
  def build
    car = SportsCarBody.new
    car.engine = @engine_type
    car.seats = @seat_count
    car
  end
end
