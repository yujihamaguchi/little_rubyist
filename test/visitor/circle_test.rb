# frozen_string_literal: true

require_relative "../test_helper"

class CircleTest < Minitest::Test
  def test_accept
    # Arrange
    circle = Circle.new
    visitor = CustomMock.new
    visitor.expect :visit_for_circle, nil, [circle]

    # Act
    circle.accept(visitor: visitor)

    # Assert
    visitor.verify
  end
end
