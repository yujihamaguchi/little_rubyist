# frozen_string_literal: true

module ShapeVisitor
  def visit_dot(dot)
    raise NotImplementedError
  end

  def visit_circle(circle)
    raise NotImplementedError
  end
end
