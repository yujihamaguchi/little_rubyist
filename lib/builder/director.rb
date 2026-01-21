# frozen_string_literal: true

require_relative "./product/sport_engine"
require_relative "./product/normal_engine"
require_relative "./product/seat"
require_relative "./product/roof_rail"
class Director
  def construct_sports_car(builder:)
    builder.with_engine(SportEngine.new)
           .with_seats(2.times.map { Seat.new })
           .build
  end

  def construct_suv_car(builder:)
    builder.with_engine(NormalEngine.new)
           .with_seats(4.times.map { Seat.new })
           .with_roof_rails(2.times.map { RoofRail.new(color: :black) })
           .build
  end
end
