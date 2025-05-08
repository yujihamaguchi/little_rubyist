# frozen_string_literal: true

require_relative "../test_helper"
require_relative "../../lib/factory3_abstract_factory/furniture_studio"
require_relative "../../lib/factory3_abstract_factory/factory/art_deco_style_factory"
require_relative "../../lib/factory3_abstract_factory/factory/modern_style_factory"

# 互いに協調して動作する複数の製品クラスを“バリエーションごと”にまとめて生成できるようにし
# クライアントはそのバリエーションを選択するだけで、互換性の取れたオブジェクト群を得られるようにしたい
class FurnitureStudioE2eTest < Minitest::Test
  def test_create_art_deco_style_table_set
    # Arrange
    art_deco_style_factory = ArtDecoStyleFactory.new
    furniture_studio = FurnitureStudio.new(factory: art_deco_style_factory)

    # Act
    table_set = furniture_studio.create_table_set

    # Assert
    assert_equal "Sit on the art deco style chair.", table_set.chair.sit
    assert_equal "Stand on the art deco style table.", table_set.table.stand
  end

  def test_create_modern_style_table_set
    # Arrange
    modern_style_factory = ModernStyleFactory.new
    furniture_studio = FurnitureStudio.new(factory: modern_style_factory)

    # Act
    table_set = furniture_studio.create_table_set

    # Assert
    assert_equal "Sit on the modern style chair.", table_set.chair.sit
    assert_equal "Stand on the modern style table.", table_set.table.stand
  end
end
