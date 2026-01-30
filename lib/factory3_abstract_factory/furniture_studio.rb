# frozen_string_literal: true

require_relative "./product/table_set"
class FurnitureStudio
  def initialize(factory:)
    @factory = factory
  end

  def create_table_set
    TableSet.new(table: @factory.create_table,
                 chair: @factory.create_chair)
  end
end
