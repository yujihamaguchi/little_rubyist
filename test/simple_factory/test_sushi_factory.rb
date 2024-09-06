# frozen_string_literal: true

require_relative "../test_helper"
require "simple_factory/ikura"
require "simple_factory/norimaki"

class TestSushiFactory < Minitest::Test
  TESTCASES = {
    # input => expected
    Ikura: Ikura,
    Norimaki: Norimaki
  }.freeze

  def test_create_ikura
    TESTCASES.each do |input, expected|
      # Arrange
      sushi_factory = SushiFactory.new

      # Act
      actual = sushi_factory.create(input)

      # Assert
      assert_equal expected, actual.class
    end
  end
end
