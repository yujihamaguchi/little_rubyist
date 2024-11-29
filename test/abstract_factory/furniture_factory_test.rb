# frozen_string_literal: true

require_relative "../test_helper"
require "abstract_factory/art_deco_style_chair"
require "abstract_factory/art_deco_style_table"
require "abstract_factory/art_deco_style_bench"
require "abstract_factory/art_deco_style_factory"
require "abstract_factory/modern_style_factory"
require "abstract_factory/modern_style_chair"
require "abstract_factory/modern_style_bench"
require "abstract_factory/modern_style_table"

class FurnitureFactoryTest < Minitest::Test
  TESTCASES = [
    { factory: ArtDecoStyleFactory, action: :create_chair, factory_class: ArtDecoStyleChair },
    { factory: ArtDecoStyleFactory, action: :create_table, factory_class: ArtDecoStyleTable },
    { factory: ArtDecoStyleFactory, action: :create_bench, factory_class: ArtDecoStyleBench },
    { factory: ModernStyleFactory, action: :create_chair, factory_class: ModernStyleChair },
    { factory: ModernStyleFactory, action: :create_table, factory_class: ModernStyleTable },
    { factory: ModernStyleFactory, action: :create_bench, factory_class: ModernStyleBench }
  ].freeze

  def test_create_chair
    TESTCASES.each do |test_case|
      factory = test_case[:factory]
      action = test_case[:action]
      furniture_class = test_case[:factory_class]

      # Arrange
      furniture_factory = factory.new
      furniture = furniture_class.new

      # Assert
      actual = nil
      furniture_class.stub :new, furniture do
        actual = furniture_factory.send(action)
      end

      # Assert
      assert_equal furniture, actual
    end
  end
end
