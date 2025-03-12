# frozen_string_literal: true

require_relative "../test_helper"
require_relative "../../lib/builder/car_builder"

class CarBuilderE2eTest < Minitest::Test
  def setup
    @product = Car.new
  end

  def test_product_without_engine
    # Arrange
    builder = CarBuilder.new

    # Act & Assert
    assert_raises(RuntimeError) do
      builder.stub :product, @product do
        builder.with_seats(count: 1).finalize
      end
    end
  end

  # def test_product_without_seats
  #   # Arrange
  #   builder = CarBuilder.new
  #
  #   # Act & Assert
  #   assert_raises(RuntimeError) do
  #     builder.with_engine(type: "foo").finalize
  #   end
  # end
end
