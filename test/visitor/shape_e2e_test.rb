# frozen_string_literal: true

require_relative "../test_helper"
require_relative "../../lib/visitor/xml_exporter"
require_relative "../../lib/visitor/dot"
require_relative "../../lib/visitor/circle"
require_relative "../../lib/visitor/json_exporter"

# 対象となるオブジェクト群に対し、クラスごとに振る舞いが異なるが共通の目的を持つ処理を、対象クラスを変更せずに追加できるようにしたい。
# （ビジネスロジックの本体を汚さずに、二次的な処理を柔軟に拡張できるようにしたい）
class ShapeE2eTest < Minitest::Test
  def test_dot_accept_xml_exporter
    # Arrange
    visitor = XMLExporter.new
    dot = Dot.new(x: 1, y: 2)

    # Act
    result = dot.accept(visitor)

    # Assert
    assert_equal "XMLed Dot(x: 1, y: 2)", result
  end

  def test_circle_accept_xml_exporter
    # Arrange
    visitor = XMLExporter.new
    circle = Circle.new(x: 3, y: 4, r: 5)

    # Act
    result = circle.accept(visitor)

    # Assert
    assert_equal "XMLed Circle(x: 3, y: 4, r: 5)", result
  end

  def test_dot_accept_json_exporter
    # Arrange
    visitor = JSONExporter.new
    dot = Dot.new(x: 1, y: 2)

    # Act
    result = dot.accept(visitor)

    # Assert
    assert_equal "JSONed Dot(x: 1, y: 2)", result
  end

  def test_circle_accept_json_exporter
    # Arrange
    visitor = JSONExporter.new
    circle = Circle.new(x: 3, y: 4, r: 5)

    # Act
    result = circle.accept(visitor)

    # Assert
    assert_equal "JSONed Circle(x: 3, y: 4, r: 5)", result
  end
end
