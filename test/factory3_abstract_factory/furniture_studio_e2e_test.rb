# frozen_string_literal: true

require_relative "../test_helper"
require_relative "../../lib/factory3_abstract_factory/furniture_studio"
require_relative "../../lib/factory3_abstract_factory/factory/art_deco_style_furniture_factory"
require_relative "../../lib/factory3_abstract_factory/factory/modern_style_furniture_factory"

# 関連するオブジェクト群をバリエーション別にまとめ、クライアントがバリエーションを選択するだけで、
# 具体的なクラスに依存せず、互換性の担保された一貫性のあるオブジェクト群を生成できるようにしたい
class FurnitureStudioE2eTest < Minitest::Test
  def test_create_art_deco_style_table_set
    # Arrange
    art_deco_style_factory = ArtDecoStyleFurnitureFactory.new
    furniture_studio = FurnitureStudio.new(factory: art_deco_style_factory)

    # Act
    table_set = furniture_studio.create_table_set

    # Assert
    assert_equal "Sit on the art deco style chair.", table_set.chair.sit
    assert_equal "Stand on the art deco style table.", table_set.table.stand
  end

  def test_create_modern_style_table_set
    # Arrange
    modern_style_factory = ModernStyleFurnitureFactory.new
    furniture_studio = FurnitureStudio.new(factory: modern_style_factory)

    # Act
    table_set = furniture_studio.create_table_set

    # Assert
    assert_equal "Sit on the modern style chair.", table_set.chair.sit
    assert_equal "Stand on the modern style table.", table_set.table.stand
  end
end
