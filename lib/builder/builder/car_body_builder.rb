# frozen_string_literal: true

require_relative "../product/car"
class CarBodyBuilder
  def with_engine(engine_type)
    @engine_type = engine_type
    self
  end

  def with_seats(seat_count)
    @seat_count = seat_count
    self
  end

  def build
    Car.new(engine_type: @engine_type, seats: @seat_count)
  end
end
