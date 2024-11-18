# frozen_string_literal: true

class XMLExportVisitor
  def visit(shape:)
    "XMLed #{shape.class.name.downcase}"
  end
end
