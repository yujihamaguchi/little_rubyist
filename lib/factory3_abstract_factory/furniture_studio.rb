# frozen_string_literal: true

class FurnitureStudio
  def initialize(factory:)
    @factory = factory
  end

  def create_table_set
    @factory.create_table_set
  end
end
