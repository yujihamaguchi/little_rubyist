# frozen_string_literal: true

require_relative "../product/table_set"

class FurnitureFactory
  def create_table_set
    TableSet.new(table: create_table, chair: create_chair)
  end

  def create_table
    raise NotImplementedError
  end

  def create_chair
    raise NotImplementedError
  end
end
