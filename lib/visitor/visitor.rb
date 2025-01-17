# frozen_string_literal: true

module Visitor
  def visit_for_dot(_)
    raise NotImplementedError
  end

  def visit_for_circle(_)
    raise NotImplementedError
  end

  def visit_for_rectangle(_)
    raise NotImplementedError
  end
end
