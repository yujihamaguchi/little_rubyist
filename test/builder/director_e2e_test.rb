# frozen_string_literal: true

require_relative "../test_helper"
require_relative "../../lib/builder/director"
require_relative "../../lib/builder/builder/car_body_builder"
require_relative "../../lib/builder/builder/car_manual_builder"

# 複雑なオブジェクト生成過程を段階的に行いたい（ついでに複雑な生成過程を担う Builder を差し替えて様々なものを生成したい）
class DirectorE2eTest < Minitest::Test
  def test_construct_sports_car_body
    # Arrange
    director = Director.new
    car_builder = CarBodyBuilder.new

    # Act
    car = director.construct_sports_car(builder: car_builder)

    # Assert
    assert_equal "sport engine", car.engine
    assert_equal 2, car.seats
  end

  def test_construct_sports_car_manual
    # Arrange
    director = Director.new
    car_manual_builder = CarManualBuilder.new

    # Act
    manual = director.construct_sports_car(builder: car_manual_builder)

    # Assert
    assert_equal "sport engine manual", manual.engine
    assert_equal "2 seats", manual.seats
  end

  def test_construct_suv_car_body
    # Arrange
    director = Director.new
    car_builder = CarBodyBuilder.new

    # Act
    car = director.construct_suv_car(builder: car_builder)

    # Assert
    assert_equal "normal engine", car.engine
    assert_equal 4, car.seats
    assert_equal :black, car.roof_rails
  end

  def test_construct_suv_car_manual
    # Arrange
    director = Director.new
    car_manual_builder = CarManualBuilder.new

    # Act
    manual = director.construct_suv_car(builder: car_manual_builder)

    # Assert
    assert_equal "normal engine manual", manual.engine
    assert_equal "4 seats", manual.seats
    assert_nil manual.roof_rails
  end
end