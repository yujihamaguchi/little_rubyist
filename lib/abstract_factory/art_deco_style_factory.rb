# frozen_string_literal: true

require_relative "furniture_factory"

class ArtDecoStyleFactory < FurnitureFactory
  def create_chair
    ArtDecoStyleChair.new
  end

  def create_table
    ArtDecoStyleTable.new
  end

  def create_bench
    ArtDecoStyleBench.new
  end
end
