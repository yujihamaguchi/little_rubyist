# frozen_string_literal: true

require_relative "device"
require_relative "tri_level_adjustable"
class Light < Device
  attr_reader :brightness

  def initialize
    super
    @brightness = :bright
  end

  def low
    @brightness = :dim
  end

  def medium
    @brightness = :medium
  end

  def high
    @brightness = :bright
  end
end
