# frozen_string_literal: true

class Director
  def construct_sports_car(builder:)
    builder.engine("sport engine")
    builder.seats(2)
    builder.product
  end

  def construct_suv_car(builder:)
    builder.engine("normal engine")
    builder.seats(4)
    builder.car
  end
end
