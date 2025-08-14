# frozen_string_literal: true

require_relative "../test_helper"
require_relative "../../lib/visitor/dot"
require_relative "../../lib/visitor/xml_exporter"
require_relative "../../lib/visitor/circle"
require_relative "../../lib/visitor/json_exporter"

# それぞれ異なるクラスのオブジェクト群に対して、JSON や XML への書き出し・画像化など、クラスごとに内容の異なる処理の追加を容易にしたい。
# その際、ビジネスロジックを担う核心的なクラス群の改修を避けたい。また、核心的なクラスの関心事ではない処理ロジックを外だしにし、それらを集約することでメンテナンス性を保ちたい。
class ShapeE2eTest < Minitest::Test
  def test_dot_delegate_to_xml_exporter
    # Arrange
    exporter = XMLExporter.new
    dot = Dot.new(x: 1, y: 2)

    # Act
    result = dot.delegate_to(exporter)

    # Assert
    assert_equal "XMLed Dot(x: 1, y: 2)", result
  end

  def test_circle_delegate_to_xml_exporter
    # Arrange
    exporter = XMLExporter.new
    circle = Circle.new(x: 3, y: 4, r: 5)

    # Act
    result = circle.delegate_to(exporter)

    # Assert
    assert_equal "XMLed Circle(x: 3, y: 4, r: 5)", result
  end

  def test_dot_delegate_to_json_exporter
    # Arrange
    exporter = JSONExporter.new
    dot = Dot.new(x: 1, y: 2)

    # Act
    result = dot.delegate_to(exporter)

    # Assert
    assert_equal "JSONed Dot(x: 1, y: 2)", result
  end

  def test_circle_delegate_to_json_exporter
    # Arrange
    exporter = JSONExporter.new
    circle = Circle.new(x: 3, y: 4, r: 5)

    # Act
    result = circle.delegate_to(exporter)

    # Assert
    assert_equal "JSONed Circle(x: 3, y: 4, r: 5)", result
  end
end
