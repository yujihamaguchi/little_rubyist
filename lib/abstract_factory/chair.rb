# frozen_string_literal: true

require_relative "furniture"

class Chair < Furniture
  def sit
    raise NotImplementedError
  end
end
