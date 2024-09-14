# frozen_string_literal: true

require_relative "../test_helper"
require "simple_factory/ikura"
require "simple_factory/norimaki"

class SushiFactoryTest < Minitest::Test
  TESTCASES = {
    # input => expected
    ikura: Ikura,
    norimaki: Norimaki
  }.freeze

  def test_create
    TESTCASES.each do |input, expected|
      # Arrange
      sushi_factory = SushiFactory.new

      # Act
      actual = sushi_factory.create(input)

      # Assert
      assert_equal expected, actual.class
    end
  end

  def test_create_with_unknown_symbol
    # Arrange
    sushi_factory = SushiFactory.new

    # Act
    action = -> { sushi_factory.create(:unknown_symbol) }

    # Assert
    assert_raises ArgumentError, &action
  end
end
