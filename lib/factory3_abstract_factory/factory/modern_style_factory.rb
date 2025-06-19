# frozen_string_literal: true

require_relative "./furniture_factory"
require_relative "../product/modern_style_chair"
require_relative "../product/modern_style_table"
class ModernStyleFactory
  include FurnitureFactory

  def create_chair
    ModernStyleChair.new
  end

  def create_table
    ModernStyleTable.new
  end
end
