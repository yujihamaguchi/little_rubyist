# frozen_string_literal: true

require_relative "../test_helper"
require_relative "../../lib/builder/director"

class DirectorTest < Minitest::Test
  def test_construct_sports_car
    # Arrange
    director = Director.new
    builder1 = CustomMock.new
    builder2 = CustomMock.new
    builder1.expect :with_engine, builder2, type: "sport engine"
    builder3 = CustomMock.new
    builder2.expect :with_seats, builder3, count: 2
    car = CustomMock.new
    builder3.expect :build, car

    # Act
    result = director.construct_sports_car(builder: builder1)

    # Assert
    assert_equal car, result
    builder1.verify
    builder2.verify
    builder3.verify
  end

  def test_construct_suv_car
    # Arrange
    director = Director.new
    builder1 = CustomMock.new
    builder2 = CustomMock.new
    builder1.expect :with_engine, builder2, type: "normal engine"
    builder3 = CustomMock.new
    builder2.expect :with_seats, builder3, count: 4
    builder4 = CustomMock.new
    builder3.expect :with_roof_rails, builder4, color: :black
    car = CustomMock.new
    builder4.expect :build, car

    # Act
    result = director.construct_suv_car(builder: builder1)

    # Assert
    assert_equal car, result
    builder1.verify
    builder2.verify
    builder3.verify
    builder4.verify
  end
end
