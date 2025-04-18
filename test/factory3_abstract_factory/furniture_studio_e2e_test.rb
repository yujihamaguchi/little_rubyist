# frozen_string_literal: true

require_relative "../test_helper"
require_relative "../../lib/factory3_abstract_factory/furniture_studio"
require_relative "../../lib/factory3_abstract_factory/factory/art_deco_style_factory"
require_relative "../../lib/factory3_abstract_factory/factory/modern_style_factory"

# クライアントから、互いに関連するオブジェクト群の生成やその組み合わせに関する詳細な実装ロジックが隠蔽され、一貫性ある統一インターフェースを通じて提供されるようにしたい
class FurnitureStudioE2eTest < Minitest::Test
  TEST_CASES = [
    { factory_class: ArtDecoStyleFactory, style_name: "art deco" },
    { factory_class: ModernStyleFactory, style_name: "modern" }
  ].freeze

  def test_create_table_set
    TEST_CASES.each do |test_case|
      factory_class = test_case[:factory_class]
      style_name = test_case[:style_name]

      # Arrange
      some_style_factory = factory_class.new
      furniture_studio = FurnitureStudio.new(factory: some_style_factory)

      # Act
      table_set = furniture_studio.create_table_set

      # Assert
      assert_equal "Sit on the #{style_name} chair.", table_set.chair.sit
      assert_equal "Stand on the #{style_name} table.", table_set.table.stand
    end
  end
end
