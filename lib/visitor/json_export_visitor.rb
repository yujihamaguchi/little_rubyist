# frozen_string_literal: true

require_relative "visitor"
class JSONExportVisitor
  include Visitor
  def visit_dot(dot)
    "JSONed Dot(x: #{dot.x}, y: #{dot.y})"
  end

  def visit_circle(circle)
    "JSONed Circle(x: #{circle.x}, y: #{circle.y}, r: #{circle.r})"
  end

  def visit_square(square)
    "JSONed Square(x: #{square.x}, y: #{square.y}, w: #{square.w})"
  end
end
