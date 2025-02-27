# frozen_string_literal: true

require "minitest/autorun"

require_relative "../../lib/abstract_factory/furniture_studio"
require_relative "../../lib/abstract_factory/table_set"

class FurnitureStudioTest < Minitest::Test
  def test_create_table_set
    # Arrange
    factory = CustomMock.new
    studio = FurnitureStudio.new(factory: factory)
    table = CustomMock.new
    chair = CustomMock.new
    factory.expect :create_table, table
    factory.expect :create_chair, chair
    table_set = CustomMock.new
    table_set.expect :table=, nil, [table]
    table_set.expect :chair=, nil, [chair]

    # Act
    TableSet.stub :new, table_set do
      studio.create_table_set
    end

    # Assert
    factory.verify
    table_set.verify
  end
end
