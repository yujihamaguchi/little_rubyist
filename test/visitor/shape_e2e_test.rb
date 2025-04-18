# frozen_string_literal: true

require_relative "../test_helper"
require_relative "../../lib/visitor/dot"
require_relative "../../lib/visitor/circle"
require_relative "../../lib/visitor/square"
require_relative "../../lib/visitor/xml_export_visitor"
require_relative "../../lib/visitor/json_export_visitor"

# 異なる型のオブジェクト群に対し、型ごとに異なる追加処理（たとえば JSON / XML 書き出しや画像化など）をあとから容易に増やせるようにしつつ、既存クラスの改修やロジック重複を避けたい
class ShapeE2eTest < Minitest::Test
  def test_accept_xml_export_visitor
    # Arrange
    visitor = XMLExportVisitor.new
    dot = Dot.new(x: 1, y: 2)
    circle = Circle.new(x: 3, y: 4, r: 5)
    square = Square.new(x: 6, y: 7, w: 8)
    shapes = [dot, circle, square]

    # Act
    result = shapes.map { |shape| shape.accept(visitor) }.join(", ")

    # Assert
    assert_equal "XMLed Dot(x: 1, y: 2), XMLed Circle(x: 3, y: 4, r: 5), XMLed Square(x: 6, y: 7, w: 8)", result
  end

  def test_accept_json_export_visitor
    # Arrange
    visitor = JSONExportVisitor.new
    dot = Dot.new(x: 1, y: 2)
    circle = Circle.new(x: 3, y: 4, r: 5)
    square = Square.new(x: 6, y: 7, w: 8)
    shapes = [dot, circle, square]

    # Act
    result = shapes.map { |shape| shape.accept(visitor) }.join(", ")

    # Assert
    assert_equal "JSONed Dot(x: 1, y: 2), JSONed Circle(x: 3, y: 4, r: 5), JSONed Square(x: 6, y: 7, w: 8)", result
  end
end
