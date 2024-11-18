# frozen_string_literal: true

require_relative "../test_helper"
require_relative "../../lib/visitor/xml_export_visitor"
require_relative "../../lib/visitor/dot"
require_relative "../../lib/visitor/circle"
require_relative "../../lib/visitor/rectangle"

class ShapeE2eTest < Minitest::Test
  def test_accept_visitor
    # Arrange
    visitor = XMLExportVisitor.new
    dot = Dot.new
    circle = Circle.new
    rectangle = Rectangle.new
    shapes = [] << dot << circle << rectangle

    # Act
    result = shapes.map { |shape| shape.accept(visitor: visitor) }.join(", ")

    # Assert
    assert_equal "XMLed dot, XMLed circle, XMLed rectangle", result
  end
end
