# frozen_string_literal: true

require_relative "../test_helper"
require_relative "../../lib/builder/director"
require_relative "../../lib/builder/car_builder"
require_relative "../../lib/builder/manual_builder"

class DirectorE2eTest < Minitest::Test
  def test_construct_sports_car
    # Arrange
    director = Director.new
    car_builder = CarBuilder.new
    manual_builder = ManualBuilder.new

    # Act
    car = director.construct_sports_car(builder: car_builder)
    manual = director.construct_sports_car(builder: manual_builder)

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

    # Act
    car = director.construct_suv_car(builder: car_builder)

    # Assert
    assert_equal "normal engine", car.engine
    assert_equal 4, car.seats
  end
end
