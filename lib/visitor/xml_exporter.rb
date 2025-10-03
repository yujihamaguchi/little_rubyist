# frozen_string_literal: true

require_relative "shape_visitor"
class XMLExporter
  include ShapeVisitor
  def visit_dot(dot)
    "XMLed Dot(x: #{dot.x}, y: #{dot.y})"
  end

  def visit_circle(circle)
    "XMLed Circle(x: #{circle.x}, y: #{circle.y}, r: #{circle.r})"
  end
end
