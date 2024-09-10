# frozen_string_literal: true

class Sushi
  def initialize
    @boxed = false
    @prepared = false
  end

  def box
    @boxed = true
    self
  end

  def prepare
    @prepared = true
    self
  end

  def boxed?
    @boxed
  end

  def prepared?
    @prepared
  end
end
