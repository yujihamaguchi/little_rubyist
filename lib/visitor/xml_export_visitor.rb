# frozen_string_literal: true

require_relative "export_visitor"

class XMLExportVisitor
  include ExportVisitor

  def visit_dot(dot)
    "XMLed #{dot.class.name}(x: #{dot.x}, y: #{dot.y})"
  end

  def visit_circle(circle)
    "XMLed #{circle.class.name}(x: #{circle.x}, y: #{circle.y}, r: #{circle.r})"
  end

  def visit_square(square)
    "XMLed #{square.class.name}(x: #{square.x}, y: #{square.y}, w: #{square.w})"
  end
end
