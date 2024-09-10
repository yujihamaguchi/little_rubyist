# frozen_string_literal: true

class SushiFactory
  def create(symbol)
    return Ikura.new if symbol == :ikura
    return Norimaki.new if symbol == :norimaki

    raise ArgumentError, "Unknown sushi type: #{symbol}"
  end
end
