# frozen_string_literal: true

require_relative "../test_helper"
require_relative "../../lib/builder/director"

class DirectorTest < Minitest::Test
  def test_construct_sports_car
    # Arrange
    director = Director.new

    builder = CustomMock.new
    builder.expect :with_engine, builder, type: Object
    builder.expect :with_seats, builder, count: Object
    car = CustomMock.new
    builder.expect :build, car

    # Act
    result = director.construct_sports_car(builder: builder)

    # Assert
    assert_equal car, result
    builder.verify
  end

  def test_construct_suv_car
    # Arrange
    director = Director.new
    builder = CustomMock.new
    builder.expect :with_engine, builder, type: Object
    builder.expect :with_seats, builder, count: Object
    builder.expect :with_roof_rails, builder, color: :black
    product = CustomMock.new
    builder.expect :build, product

    # Act
    result = director.construct_suv_car(builder: builder)

    # Assert
    assert_equal product, result
    builder.verify
  end
end
