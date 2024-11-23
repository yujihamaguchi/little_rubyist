# frozen_string_literal: true

class Director
  def construct_sports_car(builder:)
    builder.engine(engine_type: "sport engine")
    builder.seats(seat_count: 2)
    builder.result
  end

  def construct_suv_car(builder:)
    builder.engine(engine_type: "normal engine")
    builder.seats(seat_count: 4)
    builder.result
  end
end
