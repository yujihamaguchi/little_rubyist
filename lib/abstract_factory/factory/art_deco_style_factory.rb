# frozen_string_literal: true

require_relative "../product/art_deco_style_table"
require_relative "../product/art_deco_style_chair"
require_relative "furniture_factory"

class ArtDecoStyleFactory
  include FurnitureFactory

  def create_table
    ArtDecoStyleTable.new
  end

  def create_chair
    ArtDecoStyleChair.new
  end
end
