# frozen_string_literal: true

require_relative "../test_helper"
require_relative "../../lib/builder/director"

class DirectorTest < Minitest::Test
  def test_construct_sports_car
    # Arrange
    director = Director.new
    car_builder = CustomMock.new
    car = CustomMock.new
    car_builder.expect :engine, nil, ["sport engine"]
    car_builder.expect :seats, nil, [2]
    car_builder.expect :product, car

    # Act
    result = director.construct_sports_car(builder: car_builder)

    # Assert
    assert_equal car, result
    car_builder.verify
  end

  def test_construct_suv_car
    # Arrange
    director = Director.new
    car_builder = CustomMock.new
    car = CustomMock.new
    car_builder.expect :engine, nil, ["normal engine"]
    car_builder.expect :seats, nil, [4]
    car_builder.expect :car, car

    # Act
    result = director.construct_suv_car(builder: car_builder)

    # Assert
    assert_equal car, result
    car_builder.verify
  end
end
