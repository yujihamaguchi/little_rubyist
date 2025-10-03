# frozen_string_literal: true

require_relative "shape_visitor"
class JSONExporter
  include ShapeVisitor

  def visit_dot(dot)
    "JSONed Dot(x: #{dot.x}, y: #{dot.y})"
  end

  def visit_circle(circle)
    "JSONed Circle(x: #{circle.x}, y: #{circle.y}, r: #{circle.r})"
  end
end
