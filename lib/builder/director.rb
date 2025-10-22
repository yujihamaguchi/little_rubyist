# frozen_string_literal: true

require_relative "./product/car_body"
require_relative "./product/sport_engine"
require_relative "./product/seat"
require_relative "./product/roof_rail"
class Director
  def construct_sports_car(builder:)
    builder.with_engine(SportEngine.new)
           .with_seats([Seat.new] * 2)
           .build
  end

  def construct_suv_car(builder:)
    builder.with_engine(NormalEngine.new)
           .with_seats([Seat.new] * 4)
           .with_roof_rails([RoofRail.new(color: :black)] * 2)
           .build
  end
end
