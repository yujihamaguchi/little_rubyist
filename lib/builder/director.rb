# frozen_string_literal: true

class Director
  def construct_sports_car(builder:)
    builder.with_engine(type: "sport engine").with_seats(count: 2).build
  end

  def construct_suv_car(builder:)
    builder.with_engine(type: "normal engine").with_seats(count: 4).with_roof_rails(color: :black).build
  end
end
