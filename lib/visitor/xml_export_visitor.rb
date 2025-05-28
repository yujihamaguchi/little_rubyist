# frozen_string_literal: true

require_relative "visitor"
class XMLExportVisitor
  include Visitor
  def visit_dot(dot)
    "XMLed Dot(x: #{dot.x}, y: #{dot.y})"
  end

  def visit_circle(circle)
    "XMLed Circle(x: #{circle.x}, y: #{circle.y}, r: #{circle.r})"
  end

  def visit_square(square)
    "XMLed Square(x: #{square.x}, y: #{square.y}, w: #{square.w})"
  end
end
