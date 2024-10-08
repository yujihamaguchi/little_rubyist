# frozen_string_literal: true

require_relative "furniture_factory"
require_relative "modern_style_bench"
require_relative "modern_style_chair"
require_relative "modern_style_table"

class ModernStyleFactory < FurnitureFactory
  def create_chair
    ModernStyleChair.new
  end

  def create_table
    ModernStyleTable.new
  end

  def create_bench
    ModernStyleBench.new
  end
end
