# frozen_string_literal: true

require_relative "../test_helper"
require_relative "../../lib/builder/director"

class DirectorTest < Minitest::Test
  def test_construct_sports_car
    # Arrange
    director = Director.new

    builder1 = CustomMock.new
    builder2 = CustomMock.new
    builder1.expect :with_engine, builder2, engine_type: Object

    builder3 = CustomMock.new
    builder2.expect :with_seats, builder3, seat_count: Object

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
end
