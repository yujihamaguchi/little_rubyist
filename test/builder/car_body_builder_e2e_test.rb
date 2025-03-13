# frozen_string_literal: true

require_relative "../test_helper"
require_relative "../../lib/builder/builder/car_body_builder"
require_relative "../../lib/builder/product/car_body"

class CarBodyBuilderE2eTest < Minitest::Test
  def test_product
    # Arrange
    builder = CarBodyBuilder.new
    engine_type = "foo"
    seats_count = 1
    roof_rails_color = :pink

    # Act
    car = builder.with_engine(type: engine_type)
                 .with_seats(count: seats_count)
                 .with_roof_rails(color: roof_rails_color)
                 .finalize

    # Assert
    assert_equal engine_type, car.engine
    assert_equal seats_count, car.seats
    assert_equal roof_rails_color, car.roof_rails
  end
end
