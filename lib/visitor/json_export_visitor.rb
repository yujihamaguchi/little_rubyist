# frozen_string_literal: true

class JSONExportVisitor
  include Visitor

  def visit_for_dot(_)
    "JSON dot"
  end

  def visit_for_circle(_)
    "JSON circle"
  end

  def visit_for_rectangle(_)
    "JSON rectangle"
  end
end
