# frozen_string_literal: true

require_relative "../test_helper"

class TestSushiRestaurant < Minitest::Test
  def test_order
    # Arrange
    sushi = CustomMock.new
    sushi.expect :prepare, nil
    sushi.expect :box, nil
    sushi_factory = CustomMock.new
    sushi_factory.expect :create, sushi, [:some_sushi]
    sushi_restaurant = SushiRestaurant.new(factory: sushi_factory)

    # Act
    sushi_restaurant.order :some_sushi

    # Assert
    sushi_factory.verify
    sushi.verify
  end
end
