# frozen_string_literal: true

require_relative "../test_helper"
require_relative "../../lib/builder/car_body_builder"
require_relative "../../lib/builder/car"

class CarBuilderE2eTest < Minitest::Test
  def test_product
    # Arrange
    builder = CarBodyBuilder.new
    engine_type = "foo"
    seats_count = 1

    # Act
    car = builder.with_engine(type: engine_type).with_seats(count: seats_count).product

    # Assert
    assert_equal engine_type, car.engine
    assert_equal seats_count, car.seats
  end

  def test_product_without_engine
    # Arrange
    builder = CarBodyBuilder.new

    # Act & Assert
    assert_raises(RuntimeError) do
      builder.with_seats(count: 1).product
    end
  end

  def test_product_without_seats
    # Arrange
    builder = CarBodyBuilder.new

    # Act & Assert
    assert_raises(RuntimeError) do
      builder.with_engine(type: "foo").product
    end
  end
end
