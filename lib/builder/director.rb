# frozen_string_literal: true

require_relative "./product/sport_engine"
require_relative "./product/normal_engine"
require_relative "./product/seat"
require_relative "./product/roof_rails"
class Director
  def construct_sports_car(builder:)
    builder.with_engine(SportEngine.new)
           .with_seat
           .build
  end

  def construct_suv_car(builder:)
    builder.with_engine(NormalEngine.new)
           .with_seat(count: 4)
           .with_roof_rails(RoofRails.new(color: :black))
           .build
  end
end
