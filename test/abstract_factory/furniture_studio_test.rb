# frozen_string_literal: true

require_relative "../test_helper"
require "abstract_factory/table_set"

class FurnitureStudioTest < Minitest::Test
  def test_create_table_set
    # Arrange
    furniture_factory = CustomMock.new
    chair = CustomMock.new
    furniture_factory.expect :create_chair, chair
    table = CustomMock.new
    furniture_factory.expect :create_table, table
    bench = CustomMock.new
    furniture_factory.expect :create_bench, bench

    furniture_studio = FurnitureStudio.new(factory: furniture_factory)

    table_set = CustomMock.new
    table_set.expect :chair=, nil, [chair]
    table_set.expect :table=, nil, [table]
    table_set.expect :bench=, nil, [bench]

    # Act
    actual = nil
    TableSet.stub :new, table_set do
      actual = furniture_studio.create_table_set
    end

    # Assert
    assert_equal table_set, actual
    furniture_factory.verify
    table_set.verify
  end
end
