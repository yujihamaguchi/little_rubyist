# frozen_string_literal: true

require_relative "../test_helper"
require_relative "../../lib/composite/box"
require_relative "../../lib/composite/product"

# 部分が組み合わさった構成物に対してメッセージを送り、構成物総体としてのレスポンスを得たい
class BoxE2eTest < Minitest::Test
  def test_price
    # Arrange
    box = Box.new
    product1 = Product.new(price: 50)
    product2 = Product.new(price: 30)
    box.add(product1)
    box.add(product2)

    small_box = Box.new
    small_product = Product.new(price: 20)
    small_box.add(small_product)

    box.add(small_box)

    # Act
    total_price = box.price

    # Assert
    assert_equal 100, total_price
  end
end
