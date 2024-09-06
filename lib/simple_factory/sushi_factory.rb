# frozen_string_literal: true

class SushiFactory
  def create(symbol)
    return Ikura.new if symbol == :Ikura
    return Norimaki.new if symbol == :Norimaki

    nil
  end
end
