# frozen_string_literal: true

require_relative "radius"

class RoundPeg
  include Radius
  attr_reader :radius

  def initialize(radius:)
    @radius = radius
  end
end
