# frozen_string_literal: true

require_relative "furniture"

class Table < Furniture
  def stand
    raise NotImplementedError
  end
end
