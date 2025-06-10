# frozen_string_literal: true

class Box
  include Composite
  def initialize
    @composites = []
  end

  def add(composite)
    @composites << composite
  end

  def price
    @composites.sum(&:price)
  end
end
