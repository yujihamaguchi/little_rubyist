# frozen_string_literal: true

require_relative "furniture_factory"
require_relative "../product/modern_style_table"
require_relative "../product/modern_style_chair"

class ModernStyleFactory
  include FurnitureFactory

  def create_table
    ModernStyleTable.new
  end

  def create_chair
    ModernStyleChair.new
  end
end
