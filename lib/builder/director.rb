# frozen_string_literal: true

class Director
  def construct_sports_car(builder:)
    builder.with_engine(engine_type: "sport engine").with_seats(seat_count: 2).build
  end
end
