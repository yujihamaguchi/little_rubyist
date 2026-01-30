# frozen_string_literal: true

class TableSet
  attr_reader :table, :chair

  def initialize(table:, chair:)
    @table = table
    @chair = chair
  end

  def description
    "#{self.table.style.capitalize} style furniture set."
  end
end
