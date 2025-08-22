# frozen_string_literal: true

require_relative "../test_helper"
require_relative "../../lib/builder/director"
require_relative "../../lib/builder/builder/car_body_builder"
require_relative "../../lib/builder/product/sport_engine"
# require_relative "../../lib/builder/product/normal_engine"
# require_relative "../../lib/builder/builder/car_manual_builder"

# 複雑なオブジェクト生成過程を段階的に行いたい。生成過程を担う Builder を差し替えて様々なものを生成できるようにしたい。
class DirectorE2eTest < Minitest::Test
  def test_construct_sports_car_body
    # Arrange
    director = Director.new
    car_body_builder = CarBodyBuilder.new

    # Act
    car_body = director.construct_sports_car(builder: car_body_builder)

    # Assert
    assert_equal SportEngine, car_body.engine.class
    assert_equal 2, car_body.seats.count
  end

  def test_construct_suv_car_body
    # Arrange
    director = Director.new
    car_builder = CarBodyBuilder.new

    # Act
    car_body = director.construct_suv_car(builder: car_builder)

    # Assert
    assert_equal NormalEngine, car_body.engine.class
    assert_equal 4, car_body.seats.count
    assert_equal :black, car_body.roof_rails.color
  end

  # def test_construct_suv_car_manual
  #   # Arrange
  #   director = Director.new
  #   car_manual_builder = CarManualBuilder.new
  #
  #   # Act
  #   manual = director.construct_suv_car(builder: car_manual_builder)
  #
  #   # Assert
  #   assert_equal "NormalEngine equipped", manual.engine
  #   assert_equal "4 seats", manual.seat
  #   assert_equal "black roof rails", manual.roof_rails
  # end
end
