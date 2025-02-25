# frozen_string_literal: true

require_relative "../test_helper"
require_relative "../../lib/abstract_factory/furniture_studio"
require_relative "../../lib/abstract_factory/art_deco_style_factory"
require_relative "../../lib/abstract_factory/modern_style_factory"

# 関連するオブジェクトの集まりを、具象クラスを指定することなく生成したい
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
      assert_equal "Lie on the #{style_name} bench.", table_set.bench.lie
    end
  end
end
