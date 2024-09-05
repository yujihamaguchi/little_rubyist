# frozen_string_literal: true

require_relative "../test_helper"
require "simple_factory/sushi_factory"
require "simple_factory/sushi_restaurant"
require "simple_factory/ikura"
require "simple_factory/norimaki"

class TestE2eSushiRestaurant < Minitest::Test
  def test_order_ikura
    # Arrange
    sushi_restaurant = SushiRestaurant.new(factory: SushiFactory.new)

    # Act
    actual = sushi_restaurant.order(:Ikura)

    # Assert
    assert_equal Ikura, actual.class
    assert actual.prepared?
    assert actual.boxed?
  end

  def test_order_norimaki
    # Arrange
    sushi_restaurant = SushiRestaurant.new(factory: SushiFactory.new)

    # Act
    actual = sushi_restaurant.order(:Norimaki)

    # Assert
    assert_equal Norimaki, actual.class
    assert actual.prepared?
    assert actual.boxed?
  end
end
