# frozen_string_literal: true

require "minitest/autorun"
require_relative "../../lib/abstract_factory/factory/art_deco_style_factory"
require_relative "../../lib/abstract_factory/product/art_deco_style_table"
require_relative "../../lib/abstract_factory/product/art_deco_style_chair"

class ArtDecoStyleFactoryTest < Minitest::Test
  def test_create
    # Arrange
    factory = ArtDecoStyleFactory.new

    # Act & Assert
    assert_equal ArtDecoStyleTable, factory.create_table.class
    assert_equal ArtDecoStyleChair, factory.create_chair.class
  end
end
