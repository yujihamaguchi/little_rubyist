# frozen_string_literal: true

require_relative "../test_helper"

class ShapeE2eTest < Minitest::Test
  def test_accept_visitor
    # Arrange
    visitor = XMLExportVisitor.new
    dot = Dot.new
    circle = Circle.new
    rectangle = Rectangle.new
    shapes = [] << dot << circle << rectangle

    # Act
    shapes.map { |shape| shape.accept(visitor) }.join(", ")
    # Assert
    assert_equal "XMLed dot, XMLed circle, XMLed rectangle", result
  end
end
