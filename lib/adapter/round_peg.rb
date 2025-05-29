# frozen_string_literal: true

require_relative "radius_provider"
class RoundPeg
  include RadiusProvider
  attr_reader :radius

  def initialize(radius:)
    @radius = radius
  end
end
