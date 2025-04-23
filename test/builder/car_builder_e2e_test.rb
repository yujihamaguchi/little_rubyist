# frozen_string_literal: true

require_relative "../test_helper"
require_relative "../../lib/builder/builder/car_builder"

class CarBuilderE2eTest < Minitest::Test
  def setup
    @product = CarBody.new
  end

  def test_build_without_engine
    # Arrange
    builder = CarBuilder.new

    # Act & Assert
    error = assert_raises(RuntimeError) do
      builder.with_seats(count: 1).build
    end
    assert_match(/engine/, error.message)
  end

  def test_product_without_seats
    # Arrange
    builder = CarBuilder.new

    # Act & Assert
    error = assert_raises(RuntimeError) do
      builder.with_engine(type: "foo").build
    end
    assert_match(/seat/, error.message)
  end
end
