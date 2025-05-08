# frozen_string_literal: true

require_relative "./product/table_set"

class FurnitureStudio
  def initialize(factory:)
    @factory = factory
  end

  def create_table_set
    table_set = TableSet.new
    table_set.table = @factory.create_table
    table_set.chair = @factory.create_chair
    table_set
  end
end
