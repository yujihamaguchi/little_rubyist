# frozen_string_literal: true

require_relative "../product/art_deco_chair"
require_relative "../product/art_deco_table"
require_relative "furniture_factory"
class ArtDecoStyleFurnitureFactory
  include FurnitureFactory
  def create_chair
    ArtDecoChair.new
  end

  def create_table
    ArtDecoTable.new
  end
end
