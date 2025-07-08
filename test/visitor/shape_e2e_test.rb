# frozen_string_literal: true

require_relative "../test_helper"
require_relative "../../lib/visitor/dot"
require_relative "../../lib/visitor/xml_export_visitor"
require_relative "../../lib/visitor/circle"
require_relative "../../lib/visitor/json_export_visitor"

# 異なるクラスのオブジェクト群に対して、JSON や XML への書き出し・画像化などクラスごとに異なる追加処理を後から容易に追加したい。
# その際、既存クラスを改修したり同じロジックを重複させたりしたくない。
class ShapeE2eTest < Minitest::Test
  def test_dot_accept_xml_export_visitor
    # Arrange
    visitor = XMLExportVisitor.new
    dot = Dot.new(x: 1, y: 2)

    # Act
    result = dot.accept(visitor)

    # Assert
    assert_equal "XMLed Dot(x: 1, y: 2)", result
  end

  def test_circle_accept_xml_export_visitor
    # Arrange
    visitor = XMLExportVisitor.new
    circle = Circle.new(x: 3, y: 4, r: 5)

    # Act
    result = circle.accept(visitor)

    # Assert
    assert_equal "XMLed Circle(x: 3, y: 4, r: 5)", result
  end

  def test_dot_accept_json_export_visitor
    # Arrange
    visitor = JSONExportVisitor.new
    dot = Dot.new(x: 1, y: 2)

    # Act
    result = dot.accept(visitor)

    # Assert
    assert_equal "JSONed Dot(x: 1, y: 2)", result
  end

  def test_circle_accept_json_export_visitor
    # Arrange
    visitor = JSONExportVisitor.new
    circle = Circle.new(x: 3, y: 4, r: 5)

    # Act
    result = circle.accept(visitor)

    # Assert
    assert_equal "JSONed Circle(x: 3, y: 4, r: 5)", result
  end
end
