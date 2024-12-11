# frozen_string_literal: true

require_relative "../test_helper"

class BoxTest < Minitest::Test
  def test_price
    # Arrange
    box = Box.new

    product1 = CustomMock.new
    product1.expect :price, 50
    product2 = CustomMock.new
    product2.expect :price, 30
    small_box = CustomMock.new
    small_box.expect :price, 20

    box.add(product1)
    box.add(product2)
    box.add(small_box)

    # Act
    total_price = box.price

    # Assert
    product1.verify
    product2.verify
    small_box.verify
    assert_equal 100, total_price
  end
end
