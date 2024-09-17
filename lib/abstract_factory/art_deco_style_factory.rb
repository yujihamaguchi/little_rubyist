# frozen_string_literal: true

require_relative "furniture_factory"

class ArtDecoStyleFactory < FurnitureFactory
  def create_chair
    "Sit on the art deco chair."
  end

  def create_table
    "Stand on the art deco table."
  end

  def create_bench
    "Lie on the art deco bench."
  end
end
