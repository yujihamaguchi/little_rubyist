# frozen_string_literal: true

require_relative "car"
require_relative "builder"

class CarBuilder
  include Builder
  attr_reader :car

  def initialize
    @car = Car.new
  end

  def engine(engine_type:)
    @car.engine = engine_type
  end

  def seats(seat_count:)
    @car.seats = seat_count
  end

  def result
    @car
  end
end
