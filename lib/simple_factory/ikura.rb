# frozen_string_literal: true

class Ikura
  def prepared?
    @prepared
  end

  def boxed?
    @boxed
  end

  def prepare
    @prepared = true
    self
  end

  def box
    @boxed = true
    self
  end
end
