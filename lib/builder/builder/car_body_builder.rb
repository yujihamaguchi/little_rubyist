# frozen_string_literal: true

require_relative "../product/car_body"
class CarBodyBuilder
  def with_engine(engine)
    @engine = engine
    self
  end

  def with_seats(seats)
    @seats = seats
    self
  end

  def with_roof_rails(roof_rails)
    @roof_rails = roof_rails
    self
  end

  def build
    CarBody.new(engine: @engine, seats: @seats, roof_rails: @roof_rails)
  end
end
