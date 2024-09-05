# frozen_string_literal: true

class SushiFactory
  def create(_symbol)
    Ikura.new
  end
end
