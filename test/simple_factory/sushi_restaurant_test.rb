# frozen_string_literal: true

require_relative "../test_helper"

class SushiRestaurantTest < Minitest::Test
  def test_order
    # Arrange
    sushi = CustomMock.new
    prepared_sushi = CustomMock.new
    sushi.expect :prepare, prepared_sushi
    boxed_sushi = CustomMock.new
    prepared_sushi.expect :box, boxed_sushi

    sushi_factory = CustomMock.new
    sushi_factory.expect :create, sushi, [:some_sushi]
    sushi_restaurant = SushiRestaurant.new(factory: sushi_factory)

    # Act
    actual = sushi_restaurant.order :some_sushi

    # Assert
    assert_equal boxed_sushi, actual
    sushi_factory.verify
    sushi.verify
    prepared_sushi.verify
  end
end
