# frozen_string_literal: true

class Director
  def construct_sports_car(builder:)
    builder.with_engine("sport engine")
           .with_seats(2)
           .build
  end
end
