# frozen_string_literal: true

require_relative "../test_helper"
require_relative "../../lib/simple_factory/sushi_factory"
require_relative "../../lib/simple_factory/sushi_restaurant"
require_relative "../../lib/simple_factory/ikura"
require_relative "../../lib/simple_factory/norimaki"

class SushiRestaurantE2eTest < Minitest::Test
  TESTCASES = {
    ikura: Ikura,
    norimaki: Norimaki
  }.freeze

  # 欲しいオブジェクトの生成の詳細をクライアントから隠蔽し、生成ロジックを一元管理したい
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
