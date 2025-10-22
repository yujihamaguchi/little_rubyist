# frozen_string_literal: true

require_relative "../test_helper"
require_relative "../../lib/builder/director"
require_relative "../../lib/builder/builder/car_body_builder"
require_relative "../../lib/builder/product/sport_engine"
require_relative "../../lib/builder/product/normal_engine"
require_relative "../../lib/builder/builder/car_manual_builder"

# 複雑なオブジェクトの生成過程を段階的に進めたい。また、生成手順自体は共通のまま、生成の具体的内容を担う Builder を差し替えて、様々な生成結果を得られるようにしたい。
class DirectorE2eTest < Minitest::Test
  def test_construct_sports_car_body
    # Arrange
    director = Director.new
    car_body_builder = CarBodyBuilder.new

    # Act
    car_body = director.construct_sports_car(builder: car_body_builder)

    # Assert
    assert_instance_of SportEngine, car_body.engine
    assert_equal 2, car_body.seats.count
  end

  def test_construct_suv_car_body
    # Arrange
    director = Director.new
    car_body_builder = CarBodyBuilder.new

    # Act
    car_body = director.construct_suv_car(builder: car_body_builder)

    # Assert
    assert_instance_of NormalEngine, car_body.engine
    assert_equal 4, car_body.seats.count
    assert_equal 2, car_body.roof_rails.count
    assert(car_body.roof_rails.all? { |roof_rail| roof_rail.color == :black })
  end

  def test_construct_suv_car_manual
    # Arrange
    director = Director.new
    car_manual_builder = CarManualBuilder.new

    # Act
    manual = director.construct_suv_car(builder: car_manual_builder)

    # Assert
    assert_equal "Normal engine equipped", manual.engine
    assert_equal "4 seats", manual.seats
    assert_equal "Black roof rails", manual.roof_rails
  end
end
