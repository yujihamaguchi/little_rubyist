# frozen_string_literal: true

require_relative "../test_helper"
require_relative "../../lib/builder/builder/car_manual_builder"
require_relative "../../lib/builder/product/car_body"

class CarManualBuilderE2eTest < Minitest::Test
  def test_product
    # Arrange
    builder = CarManualBuilder.new
    engine_type = "foo"
    seats_count = 1
    roof_rails_color = :pink

    # Act
    manual = builder.with_engine(type: engine_type)
                    .with_seats(count: seats_count)
                    .with_roof_rails(color: roof_rails_color)
                    .finalize

    # Assert
    assert_equal "#{engine_type} manual", manual.engine
    assert_equal "#{seats_count} seats", manual.seats
    assert_nil manual.roof_rails
  end
end
