# frozen_string_literal: true

module ExportVisitor
  def visit_dot(dot)
    raise NotImplementedError
  end

  def visit_circle(circle)
    raise NotImplementedError
  end

  def visit_square(square)
    raise NotImplementedError
  end
end
