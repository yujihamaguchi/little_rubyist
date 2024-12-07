# frozen_string_literal: true

require_relative "car"
require_relative "builder"

class CarBuilder
  include Builder
  attr_reader :car

  def initialize
    @car = Car.new
  end

  def with_engine(engine_type:)
    @car.engine = engine_type
    self
  end

  def with_seats(seat_count:)
    @car.seats = seat_count
    self
  end

  def with_roof_rails(color:)
    @car.roof_rails = color
    self
  end

  def build
    @car
  end
end
