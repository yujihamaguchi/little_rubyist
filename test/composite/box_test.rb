# frozen_string_literal: true

require_relative "../test_helper"

class BoxTest < Minitest::Test
  def test_price
    # Arrange
    box = Box.new
    component1 = CustomMock.new
    component1.expect :price, 0
    component2 = CustomMock.new
    component2.expect :price, 0
    box.add(component1)
    box.add(component2)

    # Act
    box.price

    # Assert
    component1.verify
    component2.verify
  end
end
