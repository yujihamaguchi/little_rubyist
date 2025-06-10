# frozen_string_literal: true

require_relative "../test_helper"
require_relative "../../lib/composite/composite"
require_relative "../../lib/composite/box"
require_relative "../../lib/composite/product"

# リーフとコンテナ( Composite )要素からなる階層構造に対して、統一された操作で一貫したレスポンスを得たい
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
    @box.add(@product1)
    @box.add(@product2)
    @small_box.add(@small_product)
    @box.add(@small_box)

    # Act
    total_price = @box.price

    # Assert
    assert_equal 100, total_price
  end
end
