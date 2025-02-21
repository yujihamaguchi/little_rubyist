# frozen_string_literal: true

require_relative "../test_helper"
require_relative "../../lib/visitor/xml_export_visitor"
require_relative "../../lib/visitor/json_export_visitor"
require_relative "../../lib/visitor/dot"
require_relative "../../lib/visitor/circle"
require_relative "../../lib/visitor/rectangle"

# 複数のオブジェクトに共通する処理が存在するが、これらは対象オブジェクトと密接に関わっているため、単なるユーティリティ関数として切り出すことが難しい。しかし、そのまま各オブジェクト内に処理ロジックを重複させるのは避けたい。
class ShapeE2eTest < Minitest::Test
  TEST_CASES = [{ clazz: XMLExportVisitor, output: "XMLed dot, XMLed circle, XMLed rectangle" },
                { clazz: JSONExportVisitor, output: "JSON dot, JSON circle, JSON rectangle" }].freeze

  def test_accept_visitor
    TEST_CASES.each do |test_case|
      test_case => { clazz:, output: }

      # Arrange
      visitor = clazz.new
      dot = Dot.new
      circle = Circle.new
      rectangle = Rectangle.new
      shapes = [] << dot << circle << rectangle

      # Act
      result = shapes.map { |shape| shape.accept(visitor: visitor) }.join(", ")

      # Assert
      assert_equal output, result
    end
  end
end
