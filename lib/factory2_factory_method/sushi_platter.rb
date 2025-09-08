# frozen_string_literal: true

class SushiPlatter
  attr_reader :selection

  def initialize
    @selection = []
  end

  def pack
    @packed = true
    self
  end

  def plate
    @plated = true
    self
  end

  def packed?
    @packed
  end

  def plated?
    @plated
  end
end
