# frozen_string_literal: true

require_relative "../test_helper"
require_relative "../../lib/builder/car_builder"
require_relative "../../lib/builder/car"

class CarBuilderE2eTest < Minitest::Test
  def test_initialize
    # Arrange
    builder = CarBuilder.new

    # Act
    product = builder.product

    # Assert
    assert_equal Car, product.class

  end

  def test_with_engine
    # Arrange
    builder = CarBuilder.new
    engine_type = "foo"

    # Act
    product = builder.with_engine(type: engine_type).product

    # Assert
    assert_equal engine_type, product.engine.type

  end
end
