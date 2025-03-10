# frozen_string_literal: true

class Director
  def construct_sports_car(builder:)
    builder.with_engine(type: "sport engine")
           .with_seats(count: 2)
           .product
  end
end
