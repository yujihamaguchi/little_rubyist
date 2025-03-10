# frozen_string_literal: true

require_relative '../test_helper'
require_relative '../../lib/builder/director'

class DirectorTest < Minitest::Test
  def test_construct_sports_car
    # Arrange
    director = Director.new
    builder1 = CustomMock.new
    builder2 = CustomMock.new
    builder1.expect :with_engine, builder2, type: "sport engine"
    builder3 = CustomMock.new
    builder2.expect :with_seats, builder3, count: 2
    product = CustomMock.new
    builder3.expect :product, product

    # Act
    director.construct_sports_car(builder: builder1)

    # Arrange
    builder1.verify
    builder2.verify
    builder3.verify

  end
end
