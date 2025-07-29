# frozen_string_literal: true

require_relative "furniture_factory"
require_relative "../product/modern_chair"
require_relative "../product/modern_table"
class ModernStyleFurnitureFactory
  include FurnitureFactory

  def create_chair
    ModernChair.new
  end

  def create_table
    ModernTable.new
  end
end
