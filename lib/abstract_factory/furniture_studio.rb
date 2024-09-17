# frozen_string_literal: true

class FurnitureStudio
  attr_reader :chair, :table, :bench

  def initialize(factory:)
    @factory = factory
  end

  def create_table_set
    table_set = TableSet.new
    table_set.chair = @factory.create_chair
    table_set.table = @factory.create_table
    table_set.bench = @factory.create_bench
    table_set
  end
end
