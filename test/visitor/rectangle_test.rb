# frozen_string_literal: true

require_relative "../test_helper"

class RectangleTest < Minitest::Test
  def test_accept
    # Arrange
    rectangle = Rectangle.new
    visitor = CustomMock.new
    visitor.expect :visit_for_rectangle, nil, [rectangle]

    # Act
    rectangle.accept(visitor: visitor)

    # Assert
    visitor.verify
  end
end
