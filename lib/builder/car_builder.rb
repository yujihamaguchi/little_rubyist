# frozen_string_literal: true

require_relative "car"
require_relative "builder"

class CarBuilder
  include Builder
  attr_reader :car

  def initialize
    @car = Car.new
  end

  def engine(engine)
    @car.engine = engine
  end

  def seats(seats)
    @car.seats = seats
  end

  def product
    @car
  end
end
