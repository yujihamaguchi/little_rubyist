# frozen_string_literal: true

require_relative "../test_helper"

class TestSushiRestaurant < Minitest::Test
  def test_order_ikura
    # Arrange
    ikura = CustomMock.new
    ikura.expect :prepare, nil
    ikura.expect :box, nil
    sushi_factory = CustomMock.new
    sushi_factory.expect :create, ikura, [:Ikura]
    sushi_restaurant = SushiRestaurant.new(factory: sushi_factory)

    # Act
    sushi_restaurant.order :Ikura

    # Assert
    sushi_factory.verify
    ikura.verify
  end
end
