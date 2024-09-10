# frozen_string_literal: true

require_relative "../test_helper"
require "simple_factory/sushi_factory"
require "simple_factory/sushi_restaurant"
require "simple_factory/ikura"
require "simple_factory/norimaki"

class TestE2eSushiRestaurant < Minitest::Test
  TESTCASES = {
    # input => expected
    ikura: Ikura,
    norimaki: Norimaki
  }.freeze

  def test_order
    TESTCASES.each do |input, expected|
      # Arrange
      sushi_restaurant = SushiRestaurant.new(factory: SushiFactory.new)

      # Act
      actual = sushi_restaurant.order(input)

      # Assert
      assert_equal expected, actual.class
      assert actual.prepared?
      assert actual.boxed?
    end
  end
end
