# frozen_string_literal: true

require_relative "visitor"

class XMLExportVisitor
  include Visitor

  def visit_for_dot(_)
    "XMLed dot"
  end

  def visit_for_circle(_)
    "XMLed circle"
  end

  def visit_for_rectangle(_)
    "XMLed rectangle"
  end
end
