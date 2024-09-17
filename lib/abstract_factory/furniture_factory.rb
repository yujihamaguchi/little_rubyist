# frozen_string_literal: true

class FurnitureFactory
  def style
    raise NotImplementedError
  end

  def create_chair
    Chair.new(style: style)
  end

  def create_table
    Table.new(style: style)
  end

  def create_bench
    Bench.new(style: style)
  end
end
