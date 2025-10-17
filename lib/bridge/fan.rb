# frozen_string_literal: true

require_relative "tri_level_adjustable"
require_relative "slider_adjustable_device"
class Fan < SliderAdjustableDevice
  include TriLevelAdjustable
  attr_reader :speed

  def initialize
    super
    @speed = :medium
  end

  def low
    @speed = :low
  end

  def medium
    @speed = :medium
  end

  def high
    @speed = :high
  end
end
