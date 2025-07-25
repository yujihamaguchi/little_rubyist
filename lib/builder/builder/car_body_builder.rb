# frozen_string_literal: true

require_relative "car_builder"
require_relative "../product/car"
require_relative "../product/seat"

class CarBodyBuilder
  include CarBuilder
  def with_engine(engine)
    @engine = engine
    self
  end

  def with_seat(count: 2)
    @seats = count.times.map { Seat.new }
    self
  end

  def with_roof_rails(roof_rails)
    @roof_rails = roof_rails
    self
  end

  def build
    raise "engine is required" unless @engine

    car = Car.new(engine: @engine, seat: @seats)
    car.roof_rails = @roof_rails
    car
  end
end
