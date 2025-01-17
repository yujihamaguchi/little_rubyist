# frozen_string_literal: true

require_relative "ikura"
require_relative "norimaki"

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
