# frozen_string_literal: true

require_relative "../test_helper"
require_relative "../../lib/composite/price"
require_relative "../../lib/composite/box"
require_relative "../../lib/composite/product"

# 単体（ Leaf ）と集約( Composite )からなる階層構造に対し、クライアントは階層を意識しない統一されたインタフェースで操作したい。
class BoxE2eTest < Minitest::Test
  def setup
    @box = Box.new
    @product1 = Product.new(price: 50)
    @product2 = Product.new(price: 30)
    @small_box = Box.new
    @small_product = Product.new(price: 20)
  end

  def test_price
    # Arrange
    @small_box.add(@small_product)
    @box.add(@product1).add(@product2).add(@small_box)

    # Act
    total_price = @box.price

    # Assert
    assert_equal 100, total_price
  end
end
