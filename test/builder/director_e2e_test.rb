# frozen_string_literal: true

require_relative "../test_helper"
require_relative "../../lib/builder/director"
require_relative "../../lib/builder/car_builder"
require_relative "../../lib/builder/car_manual_builder"

class DirectorE2eTest < Minitest::Test
  def test_construct_sports_car
    # Arrange
    director = Director.new
    car_builder = CarBuilder.new
    car_manual_builder = CarManualBuilder.new

    # Act
    car = director.construct_sports_car(builder: car_builder)
    manual = director.construct_sports_car(builder: car_manual_builder)

    # Assert
    assert_equal "sport engine", car.engine
    assert_equal 2, car.seats
    assert_equal "sport engine manual", manual.engine
    assert_equal "2 seats", manual.seats
  end

  def test_construct_suv_car
    # Arrange
    director = Director.new
    car_builder = CarBuilder.new
    car_manual_builder = CarManualBuilder.new

    # Act
    car = director.construct_suv_car(builder: car_builder)
    manual = director.construct_suv_car(builder: car_manual_builder)

    # Assert
    assert_equal "normal engine", car.engine
    assert_equal 4, car.seats
    assert_equal "normal engine manual", manual.engine
    assert_equal "4 seats", manual.seats
  end
end
