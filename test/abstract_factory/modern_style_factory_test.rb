# frozen_string_literal: true

require "minitest/autorun"
require_relative "../../lib/abstract_factory/modern_style_factory"
require_relative "../../lib/abstract_factory/modern_style_table"
require_relative "../../lib/abstract_factory/modern_style_chair"
require_relative "../../lib/abstract_factory/modern_style_bench"

class ModernStyleFactoryTest < Minitest::Test
  def test_create
    # Arrange
    factory = ModernStyleFactory.new

    # Act & Assert
    assert_equal ModernStyleTable, factory.create_table.class
    assert_equal ModernStyleChair, factory.create_chair.class
    assert_equal ModernStyleBench, factory.create_bench.class
  end
end
