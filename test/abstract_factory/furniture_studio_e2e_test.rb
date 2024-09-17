# frozen_string_literal: true

require_relative "../test_helper"
require "abstract_factory/furniture_studio"
require "abstract_factory/art_deco_style_factory"
require "abstract_factory/modern_style_factory"

class FurnitureStudioE2eTest < Minitest::Test
  TESTCASES = [
    { klass: ArtDecoStyleFactory, str: "art deco" },
    { klass: ModernStyleFactory, str: "modern" }
  ].freeze

  def test_create_table_set
    TESTCASES.each do |testcase|
      klass = testcase[:klass]
      str = testcase[:str]

      # Arrange
      art_deco_style_factory = klass.new
      furniture_studio = FurnitureStudio.new(factory: art_deco_style_factory)

      # Act
      table_set = furniture_studio.create_table_set
      actual_sit = table_set.chair.sit
      actual_stand = table_set.table.stand
      actual_lie = table_set.bench.lie

      # Assert
      assert_equal "Sit on the #{str} chair.", actual_sit
      assert_equal "Stand on the #{str} table.", actual_stand
      assert_equal "Lie on the #{str} bench.", actual_lie
    end
  end
end
