# frozen_string_literal: true

require_relative "furniture"

class Bench < Furniture
  def lie
    raise NotImplementedError
  end
end
