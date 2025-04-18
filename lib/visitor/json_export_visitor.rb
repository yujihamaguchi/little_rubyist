# frozen_string_literal: true

require_relative "export_visitor"

class JSONExportVisitor
  include ExportVisitor

  def visit_dot(dot)
    "JSONed #{dot.class.name}(x: #{dot.x}, y: #{dot.y})"
  end

  def visit_circle(circle)
    "JSONed #{circle.class.name}(x: #{circle.x}, y: #{circle.y}, r: #{circle.r})"
  end

  def visit_square(square)
    "JSONed #{square.class.name}(x: #{square.x}, y: #{square.y}, w: #{square.w})"
  end
end
