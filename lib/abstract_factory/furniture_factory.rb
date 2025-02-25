# frozen_string_literal: true

module FurnitureFactory
  def create_table
    raise NotImplementedError
  end

  def create_chair
    raise NotImplementedError
  end

  def create_bench
    raise NotImplementedError
  end
end
