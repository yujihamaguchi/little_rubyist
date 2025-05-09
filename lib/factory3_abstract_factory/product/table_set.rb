# frozen_string_literal: true

class TableSet
  attr_reader :chair, :table

  def initialize(table:, chair:)
    @table = table
    @chair = chair
  end
end
