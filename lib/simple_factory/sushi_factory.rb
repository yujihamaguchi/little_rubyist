# frozen_string_literal: true

require "simple_factory/ikura"
require "simple_factory/norimaki"

class SushiFactory
  SUSHI_TYPES = {
    ikura: Ikura,
    norimaki: Norimaki
  }.freeze

  def create(symbol)
    klass = SUSHI_TYPES[symbol]
    raise ArgumentError, "Unknown sushi type: #{symbol}" unless klass

    klass.new
  end
end
