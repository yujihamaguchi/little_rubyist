# frozen_string_literal: true

require_relative "export_visitor"
class JSONExportVisitor
  def visit_dot(dot)
    "JSONed Dot(x: #{dot.x}, y: #{dot.y})"
  end

  def visit_circle(circle)
    "JSONed Circle(x: #{circle.x}, y: #{circle.y}, r: #{circle.r})"
  end
end
