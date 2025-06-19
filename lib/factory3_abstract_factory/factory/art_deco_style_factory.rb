# frozen_string_literal: true

require_relative "./furniture_factory"
require_relative "../product/art_deco_style_chair"
require_relative "../product/art_deco_style_table"

class ArtDecoStyleFactory
  include FurnitureFactory
  def create_chair
    ArtDecoStyleChair.new
  end

  def create_table
    ArtDecoStyleTable.new
  end
end
