# frozen_string_literal: true

require_relative "../test_helper"
require_relative "../../lib/builder/director"

class DirectorTest < Minitest::Test
  def test_construct_sports_car
    # Arrange
    director = Director.new
    car_builder = CustomMock.new
    car_product = CustomMock.new
    car_builder.expect :with_engine, car_builder, [], engine_type: "sport engine"
    car_builder.expect :with_seats, car_builder, [], seat_count: 2
    car_builder.expect :build, car_product

    # Act
    result = director.construct_sports_car(builder: car_builder)

    # Assert
    assert_equal car_product, result
    car_builder.verify
  end

  def test_construct_suv_car
    # Arrange
    director = Director.new
    car_builder = CustomMock.new
    car_product = CustomMock.new
    car_builder.expect :with_engine, car_builder, [], engine_type: "normal engine"
    car_builder.expect :with_seats, car_builder, [], seat_count: 4
    car_builder.expect :with_roof_rails, car_builder, [], color: :black
    car_builder.expect :build, car_product

    # Act
    result = director.construct_suv_car(builder: car_builder)

    # Assert
    assert_equal car_product, result
    car_builder.verify
  end
end
