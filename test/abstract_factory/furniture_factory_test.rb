# frozen_string_literal: true

require_relative "../test_helper"
require "abstract_factory/chair"
require "abstract_factory/table"
require "abstract_factory/bench"

class FurnitureFactoryTest < Minitest::Test
  TESTCASES = [
    { klass: Chair, action: :create_chair },
    { klass: Table, action: :create_table },
    { klass: Bench, action: :create_bench }
  ].freeze

  def test_create_chair
    TESTCASES.each do |test_case|
      klass = test_case[:klass]
      action = test_case[:action]

      # Arrange
      furniture_factory = FurnitureFactory.new
      style = CustomMock.new
      furniture = klass.new(style: style)

      # Assert
      actual = nil
      klass.stub :new, furniture do
        furniture_factory.stub :style, style do
          actual = furniture_factory.send(action)
        end
      end

      # Assert
      assert_equal furniture, actual
    end
  end
end
